var express = require('express');
var router = express.Router();

const {processCreate, create, edit, update, destroy} = require('../controllers/productController');

//* Middleware
const adminCheck = require('../middlewares/adminCheck');
const { uploadProductIMG } = require('../middlewares/uploadFiles')

router

/* edit */

.get('/product/:id', adminCheck, edit)
.put('/product/update/:id', uploadProductIMG.array('images'), update)
.get('/product', adminCheck, create)
.post('/product', uploadProductIMG.array('images'), processCreate)
.delete('/product/delete/:id', destroy);

module.exports = router;