const dataParser = require('../data/dataParser');

const products = dataParser.loadData('products.json');
const categories = dataParser.loadData('categories.json');
const tags = dataParser.loadData('tags.json');

function normalizeProduct(body, id)
{
    let {name, description, price, discount, category, images, tags} = body;

    name = name.trim();
    description = description.trim();
    price = +price;

    discount ? discount = +discount : discount = 0;
    category ? category = +category : category = 0;

    if(!images) images = ["product.jpg", "product-behind.jpg"];

    if(!tags) tags = [0];
    else if (tags.constructor !== Array) tags = [+tags];
    else tags = tags.map((tag) => +tag);

    return {id, name, price, discount, description, category, tags, images};
}

module.exports={
    manageProducts: (req, res)=>{
        return res.render('editProducts', {products, categories, tags});
    },
    addProduct: (req, res) =>
    {
        const newID = products[products.length - 1].id + 1;
        const newProduct = normalizeProduct(req.body, newID);

        dataParser.saveData([...products, newProduct], 'products.json');
        return res.redirect('/products/details/' + newProduct.id);
    },
    editProduct: (req, res) =>
    {
        const product = products.find(p => p.id === +req.params.id);

        return res.render('editProducts', {product, products, categories, tags});
    },
    updateProduct: (req, res) =>
    {
        const productIndex = products.findIndex((p) => p.id === +req.params.id);
        products[productIndex] = normalizeProduct(req.body, +req.params.id);

        dataParser.saveData(products, 'products.json');
        return res.redirect('/products/details/' + req.params.id);
    },
    removeProduct: (req, res) =>
    {
        const productIndex = products.findIndex((p) => p.id === +req.params.id);
        products.splice(productIndex, 1);

        dataParser.saveData(products, 'products.json');
        return res.redirect('/');
    }
}