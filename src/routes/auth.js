// ************ Require's ************
const express = require('express');
const router = express.Router();

// ************ Controller Require ************
const {signUp, signIn} = require('../controllers/authController');
const {uploadUser} = require('../middlewares');

/* /users */
router
    .post('/signup', uploadUser.single('avatar'), signUp)
    .post('/signin', signIn)

module.exports = router;
