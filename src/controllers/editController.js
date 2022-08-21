const dataParser = require('../data/dataParser');

module.exports={
    editProducts: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('editProducts', {products, categories, tags});
    }
}