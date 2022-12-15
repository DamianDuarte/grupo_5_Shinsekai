var express = require('express');
var router = express.Router();

const { count, changeTheme, getTheme } = require('../controllers/api/miscController');

router
.get('/count', count)
.get('/changeTheme', changeTheme)
.get('/getTheme', getTheme);


module.exports = router;