var express = require('express');
var router = express.Router();

const {details, payment}= require('../controllers/productController');
const userCheck = require('../middlewares/userCheck');

router

/* details & payment */
.get('/details/:id', details)
.get('/payment', userCheck, payment)

module.exports = router;