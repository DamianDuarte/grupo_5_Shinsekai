const express = require('express');
const router = express.Router();

// ******* CONTROLLERS REQUIRE ********

const { getOne, getAll, getImg } = require('../controllers/api/userController');

/* Middlewares */


/* /users */

router
    .get('/', getAll)
    .get('/:id', getOne)
    .get('/img/:filename', getImg)

module.exports = router;