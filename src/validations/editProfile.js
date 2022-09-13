const { check } = require('express-validator');
const users = require('../data/dataParser').loadData('users.json');
const bcrypt = require('bcryptjs');


module.exports = [
    check('firstName')
        .notEmpty()
        .withMessage('Debes introducir tu nombre')
        .bail()
        .isLength({ min: 2, max: 60 })
        .withMessage('Si tu nombre es mas largo o mas corto, anda al registro civil'),
    check('lastName')
        .notEmpty()
        .withMessage('Debes introducir tu nombre')
        .bail()
        .isLength({ min: 2, max: 60 })
        .withMessage('Si tu apellido es mas corto, por favor comunicarse con el record guiness'),

]

