const db = require('../database/models');
const { validationResult } = require('express-validator');
const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
const { associations, filters, createError, checkImg} = require('../helpers');
/* const multer = require('multer'); */

module.exports={
    details: async (req, res) => {
        try {
            let product = await db.products.findByPk(req.params.id, associations.get('images'))
/*             const products = await db.products.findAll();  No tengo pensado usarte hasta que ande la pagina */
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            if(!product) throw createError(404, 'Producto no encontrado.')
            
            return res.render('./products/details', { product, categories, tags });
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
	},
    payment: async (req, res)=>{
        try 
        {
            const products = await db.products.findAll();
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            return res.render('./products/payment', {products, categories, tags})
        } 
        catch (error) 
        {
            console.log(error);
            res.send(error);
        }


        /* const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/payment', {products, categories, tags}) */
    },
    /* CRUD */
    create : async(req,res)=>{
        try {
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();
            const products = await db.products.findAll(associations.get('images', 'tags')); 
          /*   return res.send(products); */
            return res.render('createProducts', {categories, tags, products, checkImg});
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
    },
    processCreate:async (req, res) => {
        try 
        {
            let errors = validationResult(req);
            if(!errors.isEmpty())
            {
                const categories = await db.categories.findAll();
                const tags = await db.tags.findAll();
                const products = await db.products.findAll(associations.get('images', 'tags')); 
                let productsOld = req.body    
                let productsErrors = errors.mapped()

                return res.render('createProducts', {categories, tags, products, productsOld, productsErrors, checkImg});
            }

            const product = await db.products.create(
                {
                    name: req.body.name.trim(),
                    price: req.body.price,
                    discount: req.body.discount,
                    description: req.body.description.trim(),
                    categoryId: req.body.categoryId
                }
            );
            
            if(req.files && req.files.length > 0)
            {
                const rows = [];
                req.files.forEach(file => 
                    {
                        rows.push({ filename: file.filename, product_id: product.id})
                    });

                await db.productimages.bulkCreate(rows);
            }

            return res.redirect('/products/details/' + product.id);
        } 
        catch (error) 
        {
            console.log(error);
            return res.send(error);
        } 
    },
    
    edit: async (req, res)=>{
        try {
            const product = await db.products.findByPk(req.params.id, associations.get('images', 'tags'));
            const products  = await db.products.findAll(associations.get('images'));
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            console.log(product);
            if(!product) throw createError(404, 'Producto no encontrado');

            return res.render('editProducts', { product, products, categories, tags, checkImg });
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
    },
    update: async (req, res)=>{
        try {

            const product = await db.products.findByPk(req.params.id, associations.get('images', 'tags'));

            let errors = validationResult(req);
            if(!errors.isEmpty())
            {
                const categories = await db.categories.findAll();
                const tags = await db.tags.findAll();
                const products = await db.products.findAll(associations.get('images', 'tags')); 
                let productsOld = req.body    
                let productsErrors = errors.mapped()

                return res.render('editProducts', {categories, tags, product, products, productsOld, productsErrors, checkImg});
            }

            if(!product) throw createError(404, 'Producto no encontrado.')

            if(req.files && req.files.length > 0)
            {
                await db.productimages.destroy(
                    { where: { product_id: product.id }}
                );

                const rows = [];
                req.files.forEach(file => 
                    {
                        rows.push({ filename: file.filename, product_id: product.id})
                    });
                
                await db.productimages.bulkCreate(rows);
            }

            await product.update({
                name: req.body.name,
                description: req.body.description,
                price: req.body.price,
                image: req.body.image,
                category_id: req.body.category_id,
                tag_id: req.body.tag_id
            })

            return res.redirect('/products/details/'+ product.id);
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
    },
    destroy: async (req, res)=>{
        try {
            const product = await db.products.findByPk(req.params.id, associations.get('images', 'tags'));
            const products  = await db.products.findAll(associations.get('images'));
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            await product.destroy();

            return res.redirect('/');
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
    }
    }
