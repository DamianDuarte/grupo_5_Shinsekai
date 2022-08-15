var express = require('express');
var router = express.Router();

const {home} = require('../controllers/mainController');

/* GET home page. */
router

/* home */
.get ('/', home)

module.exports = router;
