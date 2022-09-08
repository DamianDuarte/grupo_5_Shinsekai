var express = require('express');
var router = express.Router();

const { users, userProfile, edit, update, deleteUser } = require('../controllers/userController');
const userCheck = require('../middlewares/userCheck');

router
 .get('/', userCheck, users)
 .get('/:username', userCheck, userProfile)
 .get('/edit/:username', userCheck, edit)
 .put('/edit/:username', update)
 .delete('/delete/:username', deleteUser)

module.exports = router;