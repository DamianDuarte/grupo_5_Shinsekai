const db = require('../database/models');
const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
const { associations, filters, createError} = require('../helpers');

module.exports={
    details: async (req, res) => {
        try {
            const product = await db.products.findByPk(req.params.id, associations.get('images'))
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
    payment: (req, res)=>{
        const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./products/payment', {products, categories, tags})
    },
    /* CRUD */
    create : async(req,res)=>{
        try {
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();
            const products = await db.products.findAll(associations.get('images', 'tags')); 
            return res.render('createProducts', {categories, tags, products});
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
    },
    processCreate: async (req, res)=>{
        try 
        {
            const product = await db.products.create(req.body);
            await db.productimages.create({filename: req.file.filename ? req.file.filename : 'default.png', product_id: product.id});

            return res.redirect('/product/details/' + product.id)
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

            return res.render('editProducts', { product, products, categories, tags });
        } catch (error) {
            console.log(error);
            return res.send(error);            
        }
    },
    update: async (req, res)=>{
        try {
            const product = await db.products.findByPk(req.params.id, associations.get('images', 'tags'));
            const products  = await db.products.findAll(associations.get('images'));
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            if(!product) throw createError(404, 'Producto no encontrado.')

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
