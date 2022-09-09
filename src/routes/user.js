var express = require('express');
var router = express.Router();

const { users, userProfile, edit, update, deleteUser, editProfile, processRegister, processLogin } = require('../controllers/userController');

const registerVal = require('../validations/register');
const loginVal = require('../validations/login');

router
 .get('/', users)
 .get('/:username', userProfile)
 .get('/edit/:username', edit)
 .put('/edit/:username', update)
 .delete('/delete/:username', deleteUser)
 .get('/profile', editProfile)
 .post('/register', registerVal, processRegister)
 .post('/login', loginVal, processLogin)

module.exports = router;