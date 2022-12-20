var express = require('express');
var router = express.Router();

const { count, changeTheme, getTheme, commentProduct, reviewProduct } = require('../controllers/api/miscController');

router
.get('/count', count)
.get('/changeTheme', changeTheme)
.get('/getTheme', getTheme)
.post('/comment', commentProduct)
.post('/review', reviewProduct);

module.exports = router;