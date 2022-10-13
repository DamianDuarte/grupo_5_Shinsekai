const dataParser = require('../data/dataParser');

module.exports={
    details: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const product = products.find(p => p.id === +req.params.id);
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/details', {products, product, categories, tags})
    },
    payment: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/payment', {products, categories, tags})
    },
    create: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/create', {products, categories, tags})
    },
    edit: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const product = products.find(p => p.id === +req.params.id);
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/edit', {products, product, categories, tags})
    }, 
    update: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const product = products.find(p => p.id === +req.params.id);
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/edit', {products, product, categories, tags})
    },
    delete: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/delete', {products, categories, tags})
    },
    destroy: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/delete', {products, categories, tags})
    }  
}