const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper} = require('../../helpers');

const excludedAttr = ['created_at', 'updated_at', 'deleted_at'];
const categoryAssociations = [
    { association: 'products', attributes: { exclude: [ ...excludedAttr, 'category_id' ] },
        include: [ { association: 'images', attributes: { exclude: [ ...excludedAttr, 'product_id' ] } } ] }
];

module.exports =
{
    getAll: async (req, res) => 
    {
        const orderByChoices = ['id', 'name'];
        const perPage = req.query.limit ? +req.query.limit : 10;
        const page = (req.query.page && req.query.limit) ? +req.query.page : 0;
        const orderBy = (req.query.orderBy && orderByChoices.includes(req.query.orderBy)) ? req.query.orderBy : 'id';

        try 
        {
            let categories = await db.categories.findAll(
                {
                    include: categoryAssociations,
                    attributes: { exclude: excludedAttr },
                    limit: perPage,
                    offset: perPage * page,
                    order: [ orderBy ]
                }
            );

            //* Meta
            categories = apiHelper.addDetailToData(req, categories)
            categories = apiHelper.addImgToData(req, categories);
            categories = apiHelper.addMeta(categories, await db.categories.count());
            categories = apiHelper.addNavUrls(req, categories, page, perPage, orderBy);

            return res.status(categories.status).json(categories);
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
            let category = await db.categories.findByPk(req.params.id, 
                { 
                    include: categoryAssociations,
                    attributes: { exclude: excludedAttr }
                }
            );

            if(!category) throw createError(404, 'El categoría no pudo ser encontrada.');
            
            //* Meta
            category = apiHelper.addDetailToData(req, category);
            category = apiHelper.addImgToData(req, category);
            category = apiHelper.addMeta(category, await db.categories.count());
            
            return res.status(category.status).json(category);
        } 
        catch (error) 
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) =>
    {
        return res.sendFile(path.join(__dirname, '..','..', '..', 'public','img','categories', req.params.filename));
    }
}