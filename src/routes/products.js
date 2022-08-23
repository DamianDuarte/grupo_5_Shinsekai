var express = require('express');
var router = express.Router();

const {details, payment}= require('../controllers/productController');

router

/* details & payment */
.get('/details/:id', details)
.get('/payment', payment)

module.exports = router;