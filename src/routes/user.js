var express = require('express');
var router = express.Router();

const { users, userProfile, edit, update, deleteUser, editProfile } = require('../controllers/userController');

router
 .get('/', users)
 .get('/:username', userProfile)
 .get('/edit/:username', edit)
 .put('/edit/:username', update)
 .delete('/delete/:username', deleteUser)
 .get('/profile', editProfile)

module.exports = router;