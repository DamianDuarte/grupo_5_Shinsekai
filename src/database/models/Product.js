module.exports = (sequelize, dataTypes) => 
{
    const alias = "Product";

    const cols = 
    {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        name:{
            type: dataTypes.STRING,
            allowNull: false,
        },
        price:{
            type: dataTypes.FLOAT.UNSIGNED,
            allowNull: false,
        },
        discount:{
            type: dataTypes.INTEGER.UNSIGNED,
            defaultValue: 0,
        },
        description:{
            type: dataTypes.STRING,
            defaultValue: null,
        },
        views:{
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            defaultValue: 0,
        },
        category_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            defaultValue: null,
        }, 
        sale_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            defaultValue: null,
        },
    }
    const config = 
    {
        tableName: 'products',
        timestamps: true, //! Si no existen, poner false
        underscored: true, //! Si timeStamps tienen '', true
    };

    const Product = sequelize.define(alias, cols, config);

    return Product;
}