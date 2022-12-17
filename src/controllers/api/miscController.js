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
    }
}