// ************ Require's ************
const express = require('express');
const router = express.Router();

// ************ Controller Require ************
const {signUp, signIn} = require('../controllers/api/authController');


router.post('/signup', signUp);
router.post('/signin', signIn)

module.exports = router;