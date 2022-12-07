var express = require('express');
var router = express.Router();

const {processCreate, create, edit, update, destroy} = require('../controllers/productController');

//* Validations
const editVal = require('../validations/editProduct');

//* Middleware
const adminCheck = require('../middlewares/adminCheck');
const { uploadProductIMG } = require('../middlewares/uploadFiles')


router
.get('/product/:id', adminCheck, edit)
.put('/product/update/:id', uploadProductIMG.array('images'), editVal, update)
.get('/product', adminCheck, create)
.post('/product', uploadProductIMG.array('images'), editVal, processCreate)
.delete('/product/delete/:id', destroy);

module.exports = router;