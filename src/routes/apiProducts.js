var express = require('express');
var router = express.Router();

const { getAll, getOne, getImg, destroy } = require('../controllers/api/productController');

router
.get('/', getAll)
.get('/:id', getOne)
.get('/img/:filename', getImg)
.delete('/', destroy);

module.exports = router;