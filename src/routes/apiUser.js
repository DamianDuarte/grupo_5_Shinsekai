const express = require('express');
const router = express.Router();

// ******* CONTROLLERS REQUIRE ********

const {getProfile, setProfile, remove, getAvatar} = require('../controllers/userApiController');

/* Middlewares */


/* /users */

router
