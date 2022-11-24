const db = require('../../database/models');
const path = require('path');
const { associations, filters, createError, apiHelper} = require('../../helpers');

module.exports =
{
    getAll: async (req, res) => 
    {
        const orderByChoices = ['id', 'name', 'price', 'discount', 'views'];
        const perPage = req.query.limit ? +req.query.limit : 10;
        const page = (req.query.page && req.query.limit) ? +req.query.page : 0;
        const orderBy = (req.query.orderBy && orderByChoices.includes(req.query.orderBy)) ? req.query.orderBy : 'id';

        try 
        {
            let products = await db.products.findAll(
                {
                    include: 
                    [
                        { association: 'images' }, { association: 'category' }, { association: 'sale' }, { association: 'tags' }
                    ],
                    limit: perPage,
                    offset: perPage * page,
                    order: [orderBy]
                }
            );

            //* Meta
            products = apiHelper.addDetailToData(req, products)
            products = apiHelper.addImgToData(req, products, 'products');
            products = apiHelper.addMeta(products, await db.products.count());
            products = apiHelper.addCategoryCount(products);
            products = apiHelper.addNavUrls(req, products, page, perPage, orderBy);

            return res.status(products.status).json(products);
        } 
        catch (error) 
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getOne: async (req, res) => 
    {
        try 
        {
            if(isNaN(req.params.id)) throw createError(400, 'La id debe ser un número.')
            let product = await db.products.findByPk(req.params.id, associations.get('images', 'category', 'sale', 'tags'));

            if(!product) throw createError(404, 'El producto no pudo ser encontrado');
            
            //* Meta
            product = apiHelper.addDetailToData(req, product);
            product = apiHelper.addImgToData(req, product, 'products');
            product = apiHelper.addMeta(product, await db.products.count());
            product = apiHelper.addCategoryCount(product);
            
            return res.status(product.status).json(product);
        } 
        catch (error) 
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) =>
    {
        return res.sendFile(path.join(__dirname, '..','..', '..', 'public','img','products', req.params.filename));
    }
}