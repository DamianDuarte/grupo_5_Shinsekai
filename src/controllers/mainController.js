const dataParser = require('../data/dataParser');
const db = require('../database/models');
const { Op, Sequelize } = require("sequelize");
const { associations, checkImg } = require('../helpers');

const imgFitter = (imageCount, totalSlots) =>
{
    //* do later*/

    return ['product-wide', 'product-wide', 'product', 'product-wide', 'product', 'product', 'product']
}

module.exports={
    home: async (req, res)=>{
        try 
        {
            let products = await db.products.findAll(associations.get('images')); 
            let popular = await db.products.findAll(
                {
                    include: [{association: 'images'}],
                    order: [['views', 'DESC']],
                    limit: 7
                }
            )
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll(
                {
                    order: Sequelize.literal('rand()'),
                    limit: 5
                }
            );

            return res.render('./users/home', { products, popular, categories, tags, checkImg, imgFitter: imgFitter(7, 10)});
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