const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper } = require('../../helpers');

const excludedAttr = ['updated_at', 'deleted_at'];

const userAssociations = [
    { association: 'avatar', attributes: { exclude: [...excludedAttr, 'user_id'] } },
    { association: 'tagsFollowing', attributes: { exclude: excludedAttr }, through: { attributes: [] } },
    { association: 'subscription', attributes: { exclude: excludedAttr } },
    { association: 'linkedAccounts', attributes: { exclude: [...excludedAttr, 'user_id', 'auth'] } },
    {
        association: 'wishList', attributes: { exclude: [...excludedAttr, 'user_id'] },
        include: [{
            association: 'products', attributes: { exclude: excludedAttr }, through: { attributes: [] },
            include: [{ association: 'images', attributes: { exclude: [...excludedAttr, 'product_id'] } }]
        }]
    },
    { association: 'comments', attributes: { exclude: [...excludedAttr, 'product_id', 'user_id'] } },
    { association: 'reviews', attributes: { exclude: [...excludedAttr, 'product_id', 'user_id'] } },
    {
        association: 'viewedHistory', attributes: { exclude: [...excludedAttr, 'user_id'] },
        include: [{
            association: 'products', attributes: { exclude: [...excludedAttr] }, through: { attributes: [] },
            include: [{ association: 'images', attributes: { exclude: [...excludedAttr, 'product_id'] } }]
        }]
    },
    {
        association: 'purchasedHistory', attributes: { exclude: [...excludedAttr, 'user_id'] },
        include: [{
            association: 'products', attributes: { exclude: [...excludedAttr] }, through: { attributes: [] },
            include: [{ association: 'images', attributes: { exclude: [...excludedAttr, 'product_id'] } }]
        }]
    },
    {
        association: 'purchaseOrders', attributes: { exclude: [...excludedAttr, 'user_id'] },
        include: [{
            association: 'products', attributes: { exclude: [...excludedAttr] }, through: { attributes: [] },
            include: [{ association: 'images', attributes: { exclude: [...excludedAttr, 'product_id'] } }]
        }]
    },
];

module.exports = {
    getAll: async (req, res) => {
        const orderByChoices = ['id', 'username', 'firstName', 'isAdmin', 'subscription_id', 'sortType'];
        const perPage = req.query.limit ? +req.query.limit : 10;
        const page = req.query.page ? +req.query.page : 0;
        const orderBy = (req.query.orderBy && orderByChoices.includes(req.query.orderBy)) ? req.query.orderBy : 'id';
        const sortType = ['ASC', 'DESC'].includes(req.query.sortType) ? req.query.sortType : 'ASC';

        try {

            let users = await db.users.findAll({
                include: userAssociations,
                attributes: { exclude: [...excludedAttr, 'email', 'password', 'subscription_id'] },
                limit: perPage,
                offset: perPage * page,
                order: [ [ orderBy, sortType ] ]
            });
            users = apiHelper.addDetailToData(req, users);
            users = apiHelper.addImgToData(req, users);
            users = apiHelper.addMeta(users, await db.users.count());
            users = apiHelper.addNavUrls(req, users, page, perPage, orderBy, sortType);

            return res.status(users.status).json(users);
        } catch (error) {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getOne: async (req, res) => {
        try {
            const { id } = req.params;
            if (isNaN(id)) throw createError(400, 'No aceptamos numeros romanos, salame. Escribe en cristiano');
            let user = await db.users.findByPk(id, {
                include: userAssociations,
                attributes: { exclude: [...excludedAttr, 'email', 'password', 'subscription_id'] },
            });

            if (!user) throw createError(404, 'El usuario no pudo ser encontrado');

            user = apiHelper.addDetailToData(req, user);
            user = apiHelper.addImgToData(req, user);
            user = apiHelper.addMeta(user, await db.users.count());


            return res.status(user.status).json(user);
        } catch (error) {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) => {
        return res.sendFile(path.join(__dirname, '..', '..', '..', 'public', 'img', 'users', req.params.filename));
    },
    verifyEmail: async (req, res) => {

        try {
            const { email } = req.body;
            let user = await db.users.findOne({
                where: {
                    email
                }
            })

            return res.status(200).json({
                ok: true,
                verified: user ? true : false
            })

        } catch (error) {
            return res.status(error.status || 500).json({
                ok: false,
                error: error.message
            })
        }
    },
    verifyUserName: async (req, res) => {

        try {
            const { username } = req.body;
            let user = await db.users.findOne({
                where: {
                    username
                }
            })

            return res.status(200).json({
                ok: true,
                verified: user ? true : false
            })

        } catch (error) {
            return res.status(error.status || 500).json({
                ok: false,
                error: error.message
            })
        }
    },

}