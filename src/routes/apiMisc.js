var express = require('express');
var router = express.Router();

const { count } = require('../controllers/api/miscController');

router
.get('/count', count)

module.exports = router;