var express = require('express');
var router = express.Router();

const { manageProducts, addProduct, editProduct, updateProduct, removeProduct }= require('../controllers/editController');
const adminCheck = require('../middlewares/adminCheck');

router

/* edit */
.get('/product', adminCheck, manageProducts)
.post('/product', addProduct)
.get('/product/:id', adminCheck, editProduct)
.put('/product/update/:id', updateProduct)
.delete('/product/delete/:id', removeProduct);

module.exports = router;