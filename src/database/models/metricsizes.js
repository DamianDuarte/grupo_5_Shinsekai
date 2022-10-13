const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('metricsizes', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    amount: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'metricsizes',
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
    ]
  });
};
