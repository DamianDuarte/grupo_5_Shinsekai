var express = require('express');
var router = express.Router();

const {login, register}=require('../controllers/userController');

/* GET home page. */
router

/* login & register */
.get('/login', login)
.get ('/register', register);

module.exports = router;