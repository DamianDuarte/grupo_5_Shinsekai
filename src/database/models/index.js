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


//! ------------- Más asociaciones ---------------- 
db.linkedaccounts.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'user'
  });
db.users.hasMany(db.linkedaccounts,
  {
    foreignKey: 'user_id',
    as: 'linkedAccounts'
  });

db.products.belongsToMany(db.availablecolors,
  {
    through: 'products_availableColors',
    foreignKey: 'product_id',
    otherKey: 'availableColor_id',
    as: 'colors'
  });
db.availablecolors.belongsToMany(db.products,
  {
    through: 'products_availableColors',
    foreignKey: 'availableColor_id',
    otherKey: 'product_id',
    as: 'products'
  });

db.products.belongsToMany(db.clothessizes,
  {
    through: 'products_clothesSizes',
    foreignKey: 'product_id',
    otherKey: 'clothesSize_id',
    as: 'sizes'
  });
db.clothessizes.belongsToMany(db.products,
  {
    through: 'products_clothesSizes',
    foreignKey: 'clothesSize_id',
    otherKey: 'product_id',
    as: 'products'
  });

db.products.belongsToMany(db.metricsizes,
  {
    through: 'products_metricSizes',
    foreignKey: 'product_id',
    otherKey: 'metricSize_id',
    as: 'metricSizes'
  });
db.metricsizes.belongsToMany(db.products,
  {
    through: 'products_metricSizes',
    foreignKey: 'metricSize_id',
    otherKey: 'product_id',
    as: 'products'
  });

db.purchasedhistories.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'user'
  });
db.users.hasOne(db.purchasedhistories,
  {
    foreignKey: 'user_id',
    as: 'purchasedHistory'
  });

db.purchasedhistories.belongsToMany(db.products, 
  {
    through: 'purchasedHistories_products',
    foreignKey: 'purchasedHistory_id',
    otherKey: 'product_id',
    as: 'products'
  });
db.products.belongsToMany(db.purchasedhistories,
  {
    through: 'purchasedHistories_products',
    foreignKey: 'product_id',
    otherKey: 'purchasedHistory_id',
    as: 'histories'
  });

db.users.hasMany(db.purchaseorders,
  {
    foreignKey: 'user_id',
    as: 'purchaseOrders'
  });
db.purchaseorders.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'user'
  });

db.purchaseorders.belongsToMany(db.products,
  {
    through: 'purchaseOrders_products',
    foreignKey: 'purchaseOrder_id',
    otherKey: 'product_id',
    as: 'products'
  });
db.products.belongsToMany(db.purchaseorders,
  {
    through: 'purchaseOrders_products',
    foreignKey: 'product_id',
    otherKey: 'purchaseOrder_id',
    as: 'purchaseOrders'
  });

db.users.hasOne(db.wishlists,
  {
    foreignKey: 'user_id',
    as: 'wishList'
  });
db.wishlists.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'user'
  });

db.wishlists.belongsToMany(db.products,
  {
    through: 'wishLists_products',
    foreignKey: 'wishList_id',
    otherKey: 'product_id',
    as: 'products'
  });
db.products.belongsToMany(db.wishlists,
  {
    through: 'wishLists_products',
    foreignKey: 'product_id',
    otherKey: 'wishList_id',
    as: 'wishLists'
  });

db.users.hasOne(db.viewedhistories,
  {
    foreignKey: 'user_id',
    as: 'viewedHistory'
  });
db.viewedhistories.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'user'
  });

db.viewedhistories.belongsToMany(db.products,
  {
    through: 'viewedHistories_products',
    foreignKey: 'viewedHistory_id',
    otherKey: 'product_id',
    as: 'products'
  });
db.products.belongsToMany(db.viewedhistories,
  {
    through: 'viewedHistories_products',
    foreignKey: 'product_id',
    otherKey: 'viewedHistory_id',
    as: 'viewedHistories'
  });

db.users.hasMany(db.productcomments,
  {
    foreignKey: 'user_id',
    as: 'comments'
  });
db.productcomments.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'author'
  });

db.productcomments.belongsTo(db.products,
  {
    foreignKey: 'product_id',
    as: 'product'
  });
db.products.hasMany(db.productcomments, 
  {
    foreignKey: 'product_id',
    as: 'comments'
  });

db.users.hasMany(db.productreviews,
  {
    foreignKey: 'user_id',
    as: 'reviews'
  });
db.productreviews.belongsTo(db.users,
  {
    foreignKey: 'user_id',
    as: 'author'
  });

db.productreviews.belongsTo(db.products,
  {
    foreignKey: 'product_id',
    as: 'product'
  });
db.products.hasMany(db.productreviews,
  {
    foreignKey: 'product_id',
    as: 'reviews'
  });

module.exports = db;
