var express = require('express');
var router = express.Router();

const { getAll, getOne, getImg } = require('../controllers/api/products');
const userCheck = require('../middlewares/userCheck');

router
.get('/products', getAll)
.get('/products/:id', getOne)
.get('/products/img/:filename', getImg);

module.exports = router;