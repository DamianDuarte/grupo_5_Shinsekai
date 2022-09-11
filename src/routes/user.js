var express = require('express');
var router = express.Router();

const { users, userProfile, edit, update, deleteUser, editProfile, processRegister, processLogin, logout} = require('../controllers/userController');

//* Validations
const registerVal = require('../validations/register');
const loginVal = require('../validations/login');

//* Middleware
const userCheck = require('../middlewares/userCheck');
const adminCheck = require('../middlewares/adminCheck');

router
 .get('/', adminCheck, users)
 .get('/edit/:username', adminCheck, edit)
 .put('/edit/:username', update)
 .delete('/delete/:username', deleteUser)
 .get('/profile', userCheck, editProfile)
 .post('/register', registerVal, processRegister)
 .post('/login', loginVal, processLogin)
 .get('/logout', userCheck, logout)
 .get('/:username', userProfile)

module.exports = router;