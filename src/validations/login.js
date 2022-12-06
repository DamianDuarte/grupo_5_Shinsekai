const { check } = require('express-validator');
/* const users = require('../data/dataParser').loadData('users.json'); */
const db = require('../database/models');
const { filters } = require('../helpers');
const bcrypt = require('bcryptjs');
let userFound;

module.exports = 
[
    check('username')
        .notEmpty().withMessage("Introduce tu nombre de usuario o email.").bail()
        .custom(async (value) => 
        {
            userFound = null; //! Reseting value just in case

            value.includes('@')?
                userFound = await db.users.findOne(filters.where('email', value.trim().toLowerCase()))
                : userFound = await db.users.findOne(filters.where('username', value.trim()));

            if(userFound) return true;
            else throw new Error("No existe cuenta registrada con este usuario/email.");

            /* value.includes('@') ? 
                userFound = users.find(u => u.email === value.trim().toLowerCase())
                : userFound = users.find(u => u.userName === value.trim());

            if(userFound)
            { 
                return true;
            }
            else
            {
                throw new Error("No existe cuenta registrada con este usuario/email.");
            } */
        }),
    
    check('password')
        .notEmpty().withMessage("Introduce tu contraseña.").bail()
        .custom((value, {req}) => 
        {
            if(userFound && bcrypt.compareSync(value, userFound.password)) return true;
            else throw new Error("Campos incorrectos");
        })
]