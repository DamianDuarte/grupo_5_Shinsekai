var express = require('express');
var router = express.Router();

const {list,  create, edit, update, destroy} = require('../controllers/productController');
/* const { manageProducts, addProduct, editProduct, updateProduct, removeProduct }= require('../controllers/editController');*/
const adminCheck = require('../middlewares/adminCheck');

router

/* edit */
.get('/product', adminCheck, list)
.post('/product', create)
.get('/product/:id', adminCheck, edit)
.put('/product/update/:id', update)
.delete('/product/delete/:id', destroy);

module.exports = router;