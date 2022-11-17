const db = require('../../database/models');
const path = require('path');
const { associations, filters, createError, apiHelper} = require('../../helpers');

module.exports =
{
    getAll: async (req, res) => 
    {
        try 
        {
            let products = await db.products.findAll(associations.get('images', 'category', 'sale', 'tags'));
            products = apiHelper.addDetailToData(req, products);
            products = apiHelper.addImgToData(req, products, 'products');
            
            return apiHelper.productReply(res, products);
        } 
        catch (error) 
        {
            return apiHelper.productReply(res, null, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getOne: async (req, res) => 
    {
        try 
        {
            let product = await db.products.findByPk(req.params.id, associations.get('images', 'category', 'sale', 'tags'));

            if(!product) throw createError(404, 'El producto no pudo ser encontrado');
            product = apiHelper.addDetailToData(req, product);
            products = apiHelper.addImgToData(req, product, 'products');
            
            return apiHelper.productReply(res, product);
        } 
        catch (error) 
        {
            return apiHelper.productReply(res, null, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) =>
    {
        return res.sendFile(path.join(__dirname, '..','..', '..', 'public','img','products', req.params.filename));
    }
}