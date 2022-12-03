var express = require('express');
var router = express.Router();

const { getAll, getOne, getImg } = require('../controllers/api/saleController');

router
.get('/', getAll)
.get('/:id', getOne)
.get('/img/:filename', getImg);

module.exports = router;