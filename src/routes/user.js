var express = require('express');
var router = express.Router();

const { users, userProfile, edit,  deleteUser, editProfile, processRegister, processLogin, logout, update} = require('../controllers/userController');

//* Validations
const registerVal = require('../validations/register');
const loginVal = require('../validations/login');
const profileVal = require('../validations/editProfile')

//* Middleware
const userCheck = require('../middlewares/userCheck');
const adminCheck = require('../middlewares/adminCheck');
const ownerAdminCheck = require('../middlewares/ownerAdminCheck');
const { uploadUserIMG } = require('../middlewares/uploadFiles')

router
 .get('/', adminCheck, users)
 .get('/edit/:username', ownerAdminCheck, edit)
 .put('/edit/:username', uploadUserIMG.single('image'), profileVal, update)
 .delete('/delete/:username', deleteUser)
 .post('/register', registerVal, processRegister)
 .post('/login', loginVal, processLogin)
 .get('/logout', userCheck, logout)
 .get('/:username', userProfile)
module.exports = router;