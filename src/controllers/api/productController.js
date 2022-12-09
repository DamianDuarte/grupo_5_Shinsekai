const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper} = require('../../helpers');

const excludedAttr = ['updated_at', 'deleted_at'];

const productAssociations = [
    { association: 'images', attributes: { exclude: [ ...excludedAttr, 'product_id' ] } }, 
    { association: 'category', attributes: { exclude: excludedAttr } }, 
    { association: 'sale', attributes: { exclude: excludedAttr } }, 
    { association: 'tags', attributes: { exclude: excludedAttr }, through: { attributes: [] } },
    { association: 'colors', attributes: { exclude: excludedAttr }, through: { attributes: [] } },
    { association: 'sizes', attributes: { exclude: excludedAttr }, through: { attributes: [] } },
    { association: 'metricSizes', attributes: { exclude: excludedAttr }, through: { attributes: [] } },
    { association: 'comments', attributes: { exclude: [ ...excludedAttr, 'product_id', 'user_id' ] },
        include: [ { association: 'author', attributes: { exclude: [...excludedAttr, 'email', 'password', 'subscription_id'] },
            include: [ { association: 'avatar', attributes: { exclude: [ ...excludedAttr, 'user_id' ] } } ] } ] },
    { association: 'reviews', attributes: { exclude: [ ...excludedAttr, 'product_id', 'user_id'] },
        include: [ { association: 'author', attributes: { exclude: [...excludedAttr, 'email', 'password', 'subscription_id'] },
            include: [ { association: 'avatar', attributes: { exclude: [ ...excludedAttr, 'user_id' ] } } ] } ] }
];


module.exports =
{
    getAll: async (req, res) => 
    {
        const orderByChoices = ['id', 'name', 'price', 'discount', 'views', 'created_at'];
        const perPage = req.query.limit ? +req.query.limit : 10;
        const page = (req.query.page && req.query.limit) ? +req.query.page : 0;
        const orderBy = (req.query.orderBy && orderByChoices.includes(req.query.orderBy)) ? req.query.orderBy : 'id';
        const sortType = ['ASC', 'DESC'].includes(req.query.sortType) ? req.query.sortType : 'ASC';

        try 
        {
            let products = await db.products.findAll(
                {
                    include: productAssociations,
                    attributes: { exclude: [ ...excludedAttr, 'sale_id', 'category_id' ] },
                    limit: perPage,
                    offset: perPage * page,
                    order: [ [orderBy, sortType] ]
                }
            );

            //* Meta
            products = apiHelper.addDetailToData(req, products)
            products = apiHelper.addImgToData(req, products);
            products = apiHelper.addMeta(products, await db.products.count());
            products = apiHelper.addCategoryCount(products);
            products = apiHelper.addNavUrls(req, products, page, perPage, orderBy, sortType);

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
            let product = await db.products.findByPk(req.params.id, 
                { 
                    include: productAssociations,
                    attributes: { exclude: excludedAttr }
                }
            );

            if(!product) throw createError(404, 'El producto no pudo ser encontrado');
            
            //* Meta
            product = apiHelper.addDetailToData(req, product);
            product = apiHelper.addImgToData(req, product);
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