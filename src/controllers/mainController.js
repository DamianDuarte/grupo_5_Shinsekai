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
                    limit: 10
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
        let { keywords, category, tag } = req.query;
        try 
        {
            const whereClause = {};
              
            if(keywords)
            {
                whereClause[Op.or] = [{ name: { [Op.substring]: keywords } }, { description: { [Op.substring]: keywords } }];
            }

            if (category) 
            {
                whereClause['category_id'] = category;
            }
            
            if (tag) 
            {
                whereClause['$tags.id$'] = tag;
            }

            const products = await db.products.findAll({
                include: [
                    {
                        association: 'images'
                    },
                    {
                        association: 'tags'
                    }
                ],
                where: whereClause
            });

            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            return res.render('./users/search', { products, categories, tags, checkImg });
        } 
        catch (error) 
        {
            console.log(error);
            return res.send(error);
        }
    }
}