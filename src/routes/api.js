var express = require('express');
var router = express.Router();

const { getAll, getOne } = require('../controllers/api/products');
const userCheck = require('../middlewares/userCheck');

router
.get('/products', getAll)
.get('/products/:id', getOne);

module.exports = router;