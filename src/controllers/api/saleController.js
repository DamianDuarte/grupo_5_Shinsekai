const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper} = require('../../helpers');

const excludedAttr = ['updated_at', 'deleted_at'];
const saleAssociations = [
    { association: 'products', attributes: { exclude: [ ...excludedAttr, 'sale_id' ] },
        include: [ { association: 'images', attributes: { exclude: [ ...excludedAttr, 'product_id' ] } } ] }
];

module.exports =
{
    getAll: async (req, res) => 
    {
        const orderByChoices = ['id', 'name', 'created_at'];
        const perPage = req.query.limit ? +req.query.limit : 10;
        const page = (req.query.page && req.query.limit) ? +req.query.page : 0;
        const orderBy = (req.query.orderBy && orderByChoices.includes(req.query.orderBy)) ? req.query.orderBy : 'id';
        const sortType = ['ASC', 'DESC'].includes(req.query.sortType) ? req.query.sortType : 'ASC';

        try 
        {
            let sales = await db.sales.findAll(
                {
                    include: saleAssociations,
                    attributes: { exclude: excludedAttr },
                    limit: perPage,
                    offset: perPage * page,
                    order: [ [ orderBy, sortType ] ]
                }
            );

            //* Meta
            sales = apiHelper.addDetailToData(req, sales)
            sales = apiHelper.addImgToData(req, sales);
            sales = apiHelper.addMeta(sales, await db.sales.count());
            sales = apiHelper.addNavUrls(req, sales, page, perPage, orderBy, sortType);

            return res.status(sales.status).json(sales);
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
            let sale = await db.sales.findByPk(req.params.id, 
                { 
                    include: saleAssociations,
                    attributes: { exclude: excludedAttr }
                }
            );

            if(!sale) throw createError(404, 'La promoción no pudo ser encontrada.');
            
            //* Meta
            sale = apiHelper.addDetailToData(req, sale);
            sale = apiHelper.addImgToData(req, sale);
            sale = apiHelper.addMeta(sale, await db.sales.count());
            
            return res.status(sale.status).json(sale);
        } 
        catch (error) 
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) =>
    {
        return res.sendFile(path.join(__dirname, '..','..', '..', 'public','img','sales', req.params.filename));
    }
}