const db = require('../../database/models');
const { associations, filters, createError, apiHelper} = require('../../helpers');

module.exports =
{
    getAll: async (req, res) => 
    {
        try 
        {
            const products = await db.products.findAll(associations.get('images', 'category', 'sale', 'tags'));
            //! add link url to detail in productAnswer
            return apiHelper.productAnswer(res, products);
        } 
        catch (error) 
        {
            return apiHelper.productAnswer(res, null, 400, error);
        }
    },
    getOne: async (req, res) => {},
}