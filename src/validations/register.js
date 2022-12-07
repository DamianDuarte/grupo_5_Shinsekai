const { check } = require('express-validator');
const { users } = require('../controllers/userController');
/* const users = require('../data/dataParser').loadData('users.json'); */
const db = require('../database/models');
const { filters } = require('../helpers');

module.exports =
[
    check('username')
        .notEmpty().withMessage("Introduce tu nombre de usuario.").bail()
        .isLength({min: 2, max: 12}).withMessage("Tu nombre de usuario debe contener entre 2 y 12 caracteres.").bail()
        .custom(async (value) => 
        {
            const user = await db.users.findOne(filters.where('username', value.trim()));
            if(!user) return true;
            else throw new Error("Nombre de usuario ocupado.");
        }),

    check('email')
        .notEmpty().withMessage("Introduce tu email.").bail()
        .isEmail().withMessage("Email inválido.").bail()
        .isLength({min: 3, max: 30}).withMessage("El email solo puede contener entre 3 y 30 caracteres.")
        .custom(async (value) =>
        {
            const user = await db.users.findOne(filters.where('email', value.trim().toLowerCase()));
            if(!user) return true;
            else throw new Error("Este email ya se encuentra registrado.");
        }),

    check('password')
        .notEmpty().withMessage("Introduce tu contraseña.").bail()
        .isLength({min: 6}).withMessage("La contraseña debe poseer minimo 6 caracteres"),
    
    check('v_password')
        .notEmpty().withMessage("Verifica tu contraseña.").bail()
        .custom((value, {req}) => 
        {
            if(value === req.body.password) return true;
            else throw new Error("Las contraseñas no coinciden.");
        }),

    check('terms')
        .custom((value) =>
        {
            if(value) return true;
            else throw new Error("Debes aceptar los términos y condiciones.");    
        })

];