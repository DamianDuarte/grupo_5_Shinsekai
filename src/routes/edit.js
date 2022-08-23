var express = require('express');
var router = express.Router();

const { manageProducts, addProduct, editProduct, updateProduct, removeProduct }= require('../controllers/editController');

router

/* edit */
.get('/product', manageProducts)
.post('/product', addProduct)
.get('/product/:id', editProduct)
.put('/product/update/:id', updateProduct)
.delete('/product/delete/:id', removeProduct);

module.exports = router;