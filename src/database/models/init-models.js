var DataTypes = require("sequelize").DataTypes;
var _availablecolors = require("./availablecolors");
var _categories = require("./categories");
var _clothessizes = require("./clothessizes");
var _linkedaccounts = require("./linkedaccounts");
var _metricsizes = require("./metricsizes");
var _productcomments = require("./productcomments");
var _productimages = require("./productimages");
var _productreviews = require("./productreviews");
var _products = require("./products");
var _products_availablecolors = require("./products_availablecolors");
var _products_clothessizes = require("./products_clothessizes");
var _products_metricsizes = require("./products_metricsizes");
var _purchasedhistories = require("./purchasedhistories");
var _purchasedhistories_products = require("./purchasedhistories_products");
var _purchaseorders = require("./purchaseorders");
var _purchaseorders_products = require("./purchaseorders_products");
var _sales = require("./sales");
var _subscriptions = require("./subscriptions");
var _tags = require("./tags");
var _tags_products = require("./tags_products");
var _tags_users = require("./tags_users");
var _userimages = require("./userimages");
var _users = require("./users");
var _viewedhistories = require("./viewedhistories");
var _viewedhistories_products = require("./viewedhistories_products");
var _wishlists = require("./wishlists");
var _wishlists_products = require("./wishlists_products");

function initModels(sequelize) {
  var availablecolors = _availablecolors(sequelize, DataTypes);
  var categories = _categories(sequelize, DataTypes);
  var clothessizes = _clothessizes(sequelize, DataTypes);
  var linkedaccounts = _linkedaccounts(sequelize, DataTypes);
  var metricsizes = _metricsizes(sequelize, DataTypes);
  var productcomments = _productcomments(sequelize, DataTypes);
  var productimages = _productimages(sequelize, DataTypes);
  var productreviews = _productreviews(sequelize, DataTypes);
  var products = _products(sequelize, DataTypes);
  var products_availablecolors = _products_availablecolors(sequelize, DataTypes);
  var products_clothessizes = _products_clothessizes(sequelize, DataTypes);
  var products_metricsizes = _products_metricsizes(sequelize, DataTypes);
  var purchasedhistories = _purchasedhistories(sequelize, DataTypes);
  var purchasedhistories_products = _purchasedhistories_products(sequelize, DataTypes);
  var purchaseorders = _purchaseorders(sequelize, DataTypes);
  var purchaseorders_products = _purchaseorders_products(sequelize, DataTypes);
  var sales = _sales(sequelize, DataTypes);
  var subscriptions = _subscriptions(sequelize, DataTypes);
  var tags = _tags(sequelize, DataTypes);
  var tags_products = _tags_products(sequelize, DataTypes);
  var tags_users = _tags_users(sequelize, DataTypes);
  var userimages = _userimages(sequelize, DataTypes);
  var users = _users(sequelize, DataTypes);
  var viewedhistories = _viewedhistories(sequelize, DataTypes);
  var viewedhistories_products = _viewedhistories_products(sequelize, DataTypes);
  var wishlists = _wishlists(sequelize, DataTypes);
  var wishlists_products = _wishlists_products(sequelize, DataTypes);

  products_availablecolors.belongsTo(availablecolors, { as: "availableColor", foreignKey: "availableColor_id"});
  availablecolors.hasMany(products_availablecolors, { as: "products_availablecolors", foreignKey: "availableColor_id"});
  products.belongsTo(categories, { as: "category", foreignKey: "category_id"});
  categories.hasMany(products, { as: "products", foreignKey: "category_id"});
  products_clothessizes.belongsTo(clothessizes, { as: "clothesSize", foreignKey: "clothesSize_id"});
  clothessizes.hasMany(products_clothessizes, { as: "products_clothessizes", foreignKey: "clothesSize_id"});
  products_metricsizes.belongsTo(metricsizes, { as: "metricSize", foreignKey: "metricSize_id"});
  metricsizes.hasMany(products_metricsizes, { as: "products_metricsizes", foreignKey: "metricSize_id"});
  productcomments.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(productcomments, { as: "productcomments", foreignKey: "product_id"});
  productimages.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(productimages, { as: "productimages", foreignKey: "product_id"});
  productreviews.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(productreviews, { as: "productreviews", foreignKey: "product_id"});
  products_availablecolors.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(products_availablecolors, { as: "products_availablecolors", foreignKey: "product_id"});
  products_clothessizes.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(products_clothessizes, { as: "products_clothessizes", foreignKey: "product_id"});
  products_metricsizes.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(products_metricsizes, { as: "products_metricsizes", foreignKey: "product_id"});
  purchasedhistories_products.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(purchasedhistories_products, { as: "purchasedhistories_products", foreignKey: "product_id"});
  purchaseorders_products.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(purchaseorders_products, { as: "purchaseorders_products", foreignKey: "product_id"});
  tags_products.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(tags_products, { as: "tags_products", foreignKey: "product_id"});
  viewedhistories_products.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(viewedhistories_products, { as: "viewedhistories_products", foreignKey: "product_id"});
  wishlists_products.belongsTo(products, { as: "product", foreignKey: "product_id"});
  products.hasMany(wishlists_products, { as: "wishlists_products", foreignKey: "product_id"});
  purchasedhistories_products.belongsTo(purchasedhistories, { as: "purchasedHistory", foreignKey: "purchasedHistory_id"});
  purchasedhistories.hasMany(purchasedhistories_products, { as: "purchasedhistories_products", foreignKey: "purchasedHistory_id"});
  purchaseorders_products.belongsTo(purchaseorders, { as: "purchaseOrder", foreignKey: "purchaseOrder_id"});
  purchaseorders.hasMany(purchaseorders_products, { as: "purchaseorders_products", foreignKey: "purchaseOrder_id"});
  products.belongsTo(sales, { as: "sale", foreignKey: "sale_id"});
  sales.hasMany(products, { as: "products", foreignKey: "sale_id"});
  users.belongsTo(subscriptions, { as: "subscription", foreignKey: "subscription_id"});
  subscriptions.hasMany(users, { as: "users", foreignKey: "subscription_id"});
  tags_products.belongsTo(tags, { as: "tag", foreignKey: "tag_id"});
  tags.hasMany(tags_products, { as: "tags_products", foreignKey: "tag_id"});
  tags_users.belongsTo(tags, { as: "tag", foreignKey: "tag_id"});
  tags.hasMany(tags_users, { as: "tags_users", foreignKey: "tag_id"});
  linkedaccounts.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(linkedaccounts, { as: "linkedaccounts", foreignKey: "user_id"});
  productcomments.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(productcomments, { as: "productcomments", foreignKey: "user_id"});
  productreviews.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(productreviews, { as: "productreviews", foreignKey: "user_id"});
  purchasedhistories.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(purchasedhistories, { as: "purchasedhistories", foreignKey: "user_id"});
  purchaseorders.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(purchaseorders, { as: "purchaseorders", foreignKey: "user_id"});
  tags_users.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(tags_users, { as: "tags_users", foreignKey: "user_id"});
  userimages.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(userimages, { as: "userimages", foreignKey: "user_id"});
  viewedhistories.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(viewedhistories, { as: "viewedhistories", foreignKey: "user_id"});
  wishlists.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(wishlists, { as: "wishlists", foreignKey: "user_id"});
  viewedhistories_products.belongsTo(viewedhistories, { as: "viewedHistory", foreignKey: "viewedHistory_id"});
  viewedhistories.hasMany(viewedhistories_products, { as: "viewedhistories_products", foreignKey: "viewedHistory_id"});
  wishlists_products.belongsTo(wishlists, { as: "wishList", foreignKey: "wishList_id"});
  wishlists.hasMany(wishlists_products, { as: "wishlists_products", foreignKey: "wishList_id"});

  return {
    availablecolors,
    categories,
    clothessizes,
    linkedaccounts,
    metricsizes,
    productcomments,
    productimages,
    productreviews,
    products,
    products_availablecolors,
    products_clothessizes,
    products_metricsizes,
    purchasedhistories,
    purchasedhistories_products,
    purchaseorders,
    purchaseorders_products,
    sales,
    subscriptions,
    tags,
    tags_products,
    tags_users,
    userimages,
    users,
    viewedhistories,
    viewedhistories_products,
    wishlists,
    wishlists_products,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
