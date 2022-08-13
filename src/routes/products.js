var express = require('express');
var router = express.Router();

const {details, payment, micart}= require('../controllers/productController');

router

/* details & payment */
.get('/details', details)
.get('/payment', payment)
.get('/MICArt', micart)

module.exports = router;