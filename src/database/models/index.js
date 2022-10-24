'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const process = require('process');
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.js')[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

fs
  .readdirSync(__dirname)
  .filter(file => {
    return (file.indexOf('.') !== 0) && (file !== basename) && (file.slice(-3) === '.js');
  })
  .forEach(file => {
    const model = require(path.join(__dirname, file))(sequelize, Sequelize.DataTypes);
    db[model.name] = model;
  });

Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;


//! ------------- Asociaciones ---------------- 

db.users.belongsTo(db.subscriptions, 
  {
    foreignKey: 'subscription_id',
    as: 'subscription'
  });
db.subscriptions.hasMany(db.users, 
  {
    foreignKey: 'subscription_id',
    as: 'users'
  });

db.userimages.belongsTo(db.users, 
  {
    foreignKey: 'user_id',
    as: 'user'
  });
db.users.hasOne(db.userimages,
  {
    foreignKey: 'user_id',
    as: 'avatar'
  });

db.productimages.belongsTo(db.products,
  {
    foreignKey: 'product_id',
    as: 'product'
  });
db.products.hasMany(db.productimages,
  {
    foreignKey: 'product_id',
    as: 'images'
  });

db.products.belongsTo(db.categories,
  {
    foreignKey: 'category_id',
    as: 'category'
  });
db.categories.hasMany(db.products,
  {
    foreignKey: 'category_id',
    as: 'products'
  });

db.products.belongsTo(db.sales,
  {
    foreignKey: 'sale_id',
    as: 'sale'
  });
db.sales.hasMany(db.products,
  {
    foreignKey: 'sale_id',
    as: 'products'
  });

db.tags.belongsToMany(db.users,
  {
    through: 'tags_users',
    foreignKey: 'tag_id',
    otherKey: 'user_id',
    as: 'usersFollowing'
  });
db.users.belongsToMany(db.tags,
  {
    through: 'tags_users',
    foreignKey: 'user_id',
    otherKey: 'tag_id',
    as: 'tagsFollowing'
  });

db.tags.belongsToMany(db.products, 
  {
    through: 'tags_products',
    foreignKey: 'tag_id',
    otherKey: 'product_id',
    as: 'products'
  });
db.products.belongsToMany(db.tags,
  {
    through: 'tags_products',
    foreignKey: 'product_id',
    otherKey: 'tag_id',
    as: 'tags'
  });

module.exports = db;
