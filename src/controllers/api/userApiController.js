const db = require('../../database/models');
const path = require('path');
const { createError, apiHelper} = require('../../helpers');

module.export = {

    getOne: async (req, res) => {
        try {
            const { id } = req.params;
            const user = await User.findByPk(id, {
                attributes: {
                    exclude: ['password']
                },
                include: [
                    {
                        association: 'avatar' 
                    },
                    {
                        association: 'followingTags'
                    }

                ]
            });
            user = apiHelper.addDetailToData(req, user);
            user = apiHelper.addImgToData(req, user, 'user');
            
            return apiHelper.userReply(res, user);
        } catch (error) 
        {
            return apiHelper.userReply(res, null, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getAll: async (req, res) => {
        try {
            const users = await User.findAll({
                attributes: {
                    exclude: ['password']
                },
                include: [
                    {
                        association: 'avatar' 
                    },
                    {
                        association: 'followingTags'
                    }

                ]
            });
            users = apiHelper.addDetailToData(req, users);
            users = apiHelper.addImgToData(req, users, 'users');
            
            return apiHelper.userReply(res, users);
        } catch (error) 
        {
            return apiHelper.userReply(res, null, error.status ? error.status : 400, error.msg ? error.msg : error);
        }
    },
    getImg: async (req, res) =>
    {
        return res.sendFile(path.join(__dirname, '..','..', '..', 'public','img','products', req.params.filename));
    }


}