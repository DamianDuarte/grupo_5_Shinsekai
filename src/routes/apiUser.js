const express = require('express');
const router = express.Router();

// ******* CONTROLLERS REQUIRE ********

const { getOne, getAll, getImg } = require('../controllers/userApiController');

/* Middlewares */


/* /users */

router
    .get('/user/:id', getOne)
    .get('/user', getAll)
    .get('/user/img/:id', getImg)