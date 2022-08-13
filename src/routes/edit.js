var express = require('express');
var router = express.Router();

const { editProducts }= require('../controllers/editController');

router

/* edit */
.get('/product', editProducts);

module.exports = router;