var express = require('express');
var router = express.Router();

const { users, userProfile, edit,  deleteUser, editProfile, processRegister, processLogin, logout, update} = require('../controllers/userController');

//* Validations
const registerVal = require('../validations/register');
const loginVal = require('../validations/login');

//* Middleware
const userCheck = require('../middlewares/userCheck');
const adminCheck = require('../middlewares/adminCheck');
const { uploadUserIMG } = require('../middlewares/uploadFiles')
router
 .get('/', adminCheck, users)
 .get('/edit/:username', edit)
 .put('/edit/:username', uploadUserIMG.single('image'), update)
 .delete('/delete/:username', deleteUser)
 .get('/profile', userCheck, editProfile)
 .post('/register', registerVal, processRegister)
 .post('/login', loginVal, processLogin)
 .get('/logout', userCheck, logout)
 .get('/:userName', userProfile)
module.exports = router;