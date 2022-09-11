var express = require('express');
var router = express.Router();

const { users, userProfile, edit, update, deleteUser, editProfile, processRegister, processLogin, logout} = require('../controllers/userController');

const registerVal = require('../validations/register');
const loginVal = require('../validations/login');

router
 .get('/', users)
 .get('/edit/:username', edit)
 .put('/edit/:username', update)
 .delete('/delete/:username', deleteUser)
 .get('/profile', editProfile)
 .post('/register', registerVal, processRegister)
 .post('/login', loginVal, processLogin)
 .get('/logout', logout)
 .get('/:username', userProfile)

module.exports = router;