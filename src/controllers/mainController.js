const dataParser = require('../data/dataParser');

module.exports={
    home: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./users/home', { products, categories, tags});
    }
}