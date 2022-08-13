var express = require('express');
var router = express.Router();

const {home} =require('../controllers/mainController');
const {login, register}=require('../controllers/userController');
const {details, payment}= require('../controllers/productController');

/* GET home page. */
router

/* home */
.get ('/', home)

module.exports = router;
