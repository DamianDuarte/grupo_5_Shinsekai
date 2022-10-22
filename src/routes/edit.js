var express = require('express');
var router = express.Router();

const {processCreate, create, edit, update, destroy} = require('../controllers/productController');
const adminCheck = require('../middlewares/adminCheck');

router

/* edit */

.get('/product/:id', adminCheck, edit)
.put('/product/update/:id', update)
.get('/product', adminCheck, create)
.post('/product', processCreate)
.delete('/product/delete/:id', destroy);

module.exports = router;