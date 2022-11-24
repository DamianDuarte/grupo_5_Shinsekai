const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper } = require('../../helpers');

module.exports = {

    getOne: async (req, res) => {
        try {
            const { id } = req.params;
            if (isNaN(id)) throw createError(400, 'No aceptamos numeros romanos, salame. Escribe en cristiano');
            let user = await db.users.findByPk(id, {
                attributes: {
                    exclude: ['password']
                },
                include: [
                    {
                        association: 'avatar'
                    },
                    {
                        association: 'tagsFollowing'
                    }

                ]
            });

            if (!user) throw createError(404, 'El usuario no pudo ser encontrado');

            user = apiHelper.addDetailToData(req, user);
            user = apiHelper.addImgToData(req, user, 'users');
            user = apiHelper.addMeta(user, await db.users.count());
           

            return res.status(user.status).json(user);
        } catch (error) {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getAll: async (req, res) => {
        const orderByChoices = ['id', 'username', 'firstName', 'isAdmin', 'subscription_id'];
        const perPage = req.query.limit ? +req.query.limit : 10;
        const page = req.query.page ? +req.query.page : 0;
        const orderBy = (req.query.orderBy && orderByChoices.includes(req.query.orderBy)) ? req.query.orderBy : 'id';
        try {

            let users = await db.users.findAll({

                attributes: {
                    exclude: ['password']
                },
                include: [
                    {
                        association: 'avatar'
                    },
                    {
                        association: 'tagsFollowing'
                    }

                ],
                limit: perPage,
                offset: perPage * page,
                order: [orderBy]
            });
            users = apiHelper.addDetailToData(req, users);
            users = apiHelper.addImgToData(req, users, 'users');
            users = apiHelper.addMeta(users, await db.users.count());
            users = apiHelper.addNavUrls(req, users, page, perPage, orderBy);

            return res.status(users.status).json(users);
        } catch (error) {
            return apiHelper.error(res, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) => {
        return res.sendFile(path.join(__dirname, '..', '..', '..', 'public', 'img', 'users', req.params.filename));
    }


}