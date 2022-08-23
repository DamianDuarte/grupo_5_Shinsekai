var express = require('express');
var router = express.Router();

const {home, search} = require('../controllers/mainController');

/* GET home page. */
router

/* home */
.get ('/', home)
.get('/search', search);

module.exports = router;
