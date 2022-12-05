const express = require('express');
const router = express.Router();

// ******* CONTROLLERS REQUIRE ********

const { getOne, getAll, getImg, verifyEmail, verifyPassword } = require('../controllers/api/userController');


/* Middlewares */


/* /users */

router
    .get('/', getAll)
    .get('/:id', getOne)
    .get('/img/:filename', getImg)

    /* Validaciones */

    .post('/verify-email', verifyEmail)
    .post('/verify-password', verifyPassword)

module.exports = router;