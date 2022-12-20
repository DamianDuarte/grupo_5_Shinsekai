const db = require('../../database/models');
const path = require('path');
const { apiHelper } = require('../../helpers');

module.exports =
{
    count: async (req, res) => 
    {
        try
        {
            const products = await (db.products.count())
            const users = await (db.users.count())
            const categories = await (db.categories.count())
            const sales = await (db.sales.count())
            const tags = await (db.tags.count())

            return res.status(200).json({
                data: { products, users, categories, sales, tags },
                status: 200,
                msg: 'success'
            });
        }
        catch(error)
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },

    changeTheme : async (req, res) =>{
        if(!req.session.theme) {
            req.session.theme = 'darkTheme';
        }
        req.session.theme = req.session.theme === 'darkTheme' ? 'lightTheme' : 'darkTheme';
        return res.status(200).json({
            data: req.session.theme,
            status: 200,
            msg: 'success'
        });
    },
    getTheme: async (req, res) => {
        if(!req.session.theme) {
            req.session.theme = 'darkTheme';
        }
        return res.status(200).json({
            data: req.session.theme,
            status: 200,
            msg: 'success'
        });
    },
    commentProduct: async (req, res) =>
    {
        const { content, productId, username } = req.body;

        try
        {
            const user = await db.users.findOne({where: {username}}, {include: [{association: 'comments', include: [{association: 'product'}]}]});
            const product = await db.products.findByPk(productId, {include:[{association: 'comments', include: [{association: 'author'}]}]});
            const comment = await db.productcomments.create({
                content,
                author: user,
                product,
                user_id: user.id,
                product_id: product.id
            });

            return res.status(200).json({
                data: {
                    content,
                    username: user.username
                 },
                status: 200,
                msg: 'success'
            });
        }
        catch(error)
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    reviewProduct: async (req, res) =>
    {
        const { points, content, productId, username } = req.body;

        try
        {
            const user = await db.users.findOne({where: {username}}, {include: [{association: 'reviews', include: [{association: 'product'}]}]});
            const product = await db.products.findByPk(productId, {include:[{association: 'reviews', include: [{association: 'author'}]}]});
            const review = await db.productreviews.create({
                points,
                content,
                author: user,
                product,
                user_id: user.id,
                product_id: product.id
            });

            return res.status(200).json({
                data: {
                    points,
                    content,
                    username: user.username
                 },
                status: 200,
                msg: 'success'
            });
        }
        catch(error)
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getProductsImg: async (req, res) =>
    {
        console.log(':::::::::::::::::', req.body.ids)
        const ids = req.body.ids;

        try 
        {
            let products = await db.products.findAll({ where: { id: ids }, include: [{ association: 'images'}]});
            products = apiHelper.addImgToData(req, products);

            const data = [];

            products.forEach(p => 
            {
                data.push(
                    { 
                        id: p.id, url: 
                        (p.images && p.images.length > 0) ? p.images[0].dataValues.url : 'http://localhost:4000/api/products/img/default.png' 
                    }
                );
            });

            

            return res.status(200).json({
                data,
                status: 200,
                msg: 'success'
            });
        } 
        catch (error) 
        {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    }
}