const dataParser = require('../data/dataParser');
const db = require('../database/models');

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
    /* CRUD */
    list: (req, res)=>{
        db.products.findAll()
        .then(products => res.render('./products/list', {products}))
        .catch(error => console.log(error))
    },
    create: (req, res)=>{
        db.products.create({
            name: req.body.name,
            description: req.body.description,
            price: req.body.price,
            image: req.body.image,
            category_id: req.body.category_id,
            tag_id: req.body.tag_id
        })
        .then(()=> res.redirect('/products'))
        .catch(error => console.log(error))
    },
    edit: (req, res)=>{
        db.products.findByPk(req.params.id)
        .then(product => res.render('./products/edit', {product}))
        .catch(error => console.log(error))
    },
    update: (req, res)=>{
        db.products.update({
            name: req.body.name,
            description: req.body.description,
            price: req.body.price,
            image: req.body.image,
            category_id: req.body.category_id,
            tag_id: req.body.tag_id
        }, {
            where: {
                id: req.params.id
            }
        })
        .then(()=> res.redirect('/products'))
        .catch(error => console.log(error))
    },
    destroy: (req, res)=>{
        db.products.destroy({
            where: {
                id: req.params.id
            }
        })
        .then(()=> res.redirect('/products'))
        .catch(error => console.log(error))
    }
    }
