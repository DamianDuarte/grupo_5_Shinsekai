const dataParser = require('../data/dataParser');
const db = require('../database/models');
const { Op, Sequelize } = require("sequelize");
const { associations, checkImg } = require('../helpers');

function searchWords(product, categories, tags, words) {
    for (let i = 0; i < words.length; i++) {
        let word = words[i].toLowerCase();

        if (product.name.toLowerCase().includes(word)) return true;
        if (categories.find(c => c.id === +product.category).name.toLowerCase() === word) return true;

        for (let e = 0; e < product.tags.length; e++) {
            let tag = product.tags[e];
            if (tags.find(t => t.id === +tag).name.toLowerCase() === word) return true;
        }
    }

    return false;
}


module.exports={
    home: async (req, res)=>{
        try 
        {
            let products = await db.products.findAll(associations.get('images')); 
            let recommended = await db.products.findAll(
                {
                    include: [{association: 'images'}],
                    order: [['views', 'DESC']],
                    limit: 4
                }
            )
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll(
                {
                    order: Sequelize.literal('rand()'),
                    limit: 5
                }
            );

            return res.render('./users/home', { products, recommended, categories, tags, checkImg });
        }
        catch (error) {
            console.log(error);
            return res.send(error);
        }
    },
    search: async (req, res) => 
    {
        let { keywords } = req.query;
        try 
        {
            const products = await db.products.findAll({
                include: [
                    {
                        association: 'images'
                    }
                ],
                where: {
                    [Op.or]: [{name: {[Op.substring]: keywords}}, {description: {[Op.substring]: keywords }}]
                }
            });

            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            return res.render('./users/search', { products, categories, tags });
        } 
        catch (error) 
        {
            console.log(error);
            return res.send(error);
        }
    }
}