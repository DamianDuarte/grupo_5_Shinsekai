const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('purchaseorders_products', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    purchaseOrder_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: 'purchaseorders',
        key: 'id'
      }
    },
    product_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: 'products',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'purchaseorders_products',
    timestamps: true,
    paranoid: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
    deletedAt: 'deleted_at',
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "id_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "fk_purchaseOrders_products_purchaseOrders_idx",
        using: "BTREE",
        fields: [
          { name: "purchaseOrder_id" },
        ]
      },
      {
        name: "fk_purchaseOrders_products_products_idx",
        using: "BTREE",
        fields: [
          { name: "product_id" },
        ]
      },
    ]
  });
};
