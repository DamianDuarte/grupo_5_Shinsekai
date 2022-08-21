const dataParser = require('../data/dataParser');

module.exports={
    details: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/details', {products, categories, tags})
    },
    payment: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/payment', {products, categories, tags})
    }
}