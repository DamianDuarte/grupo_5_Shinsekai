const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper} = require('../../helpers');

const excludedAttr = ['updated_at', 'deleted_at'];
const tagAssociations = [
    { association: 'products', attributes: { exclude: [ ...excludedAttr ] },
        include: [ { association: 'images', attributes: { exclude: [ ...excludedAttr, 'product_id' ] } } ], through: { attributes: [] } }
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
            let tags = await db.tags.findAll(
                {
                    include: tagAssociations,
                    attributes: { exclude: excludedAttr },
                    limit: perPage,
                    offset: perPage * page,
                    order: [ [ orderBy, sortType ] ]
                }
            );

            //* Meta
            tags = apiHelper.addDetailToData(req, tags)
            tags = apiHelper.addImgToData(req, tags);
            tags = apiHelper.addMeta(tags, await db.tags.count());
            tags = apiHelper.addNavUrls(req, tags, page, perPage, orderBy, sortType);

            return res.status(tags.status).json(tags);
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
            let tag = await db.tags.findByPk(req.params.id, 
                { 
                    include: tagAssociations,
                    attributes: { exclude: excludedAttr }
                }
            );

            if(!tag) throw createError(404, 'La promoción no pudo ser encontrada.');
            
            //* Meta
            tag = apiHelper.addDetailToData(req, tag);
            tag = apiHelper.addImgToData(req, tag);
            tag = apiHelper.addMeta(tag, await db.tags.count());
            
            return res.status(tag.status).json(tag);
        } 
        catch (error) 
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) =>
    {
        return res.sendFile(path.join(__dirname, '..','..', '..', 'public','img','tags', req.params.filename));
    }
}