const { check } = require('express-validator');
const users = require('../data/dataParser').loadData('users.json');
const bcrypt = require('bcryptjs');
let userFound;

module.exports = 
[
    check('userName')
        .notEmpty().withMessage("Introduce tu nombre de usuario o email.").bail()
        .custom((value) => 
        {
            userFound = null; //! Reseting value just in case

            value.includes('@') ? 
                userFound = users.find(u => u.email === value.trim().toLowerCase())
                : userFound = users.find(u => u.userName === value.trim());

            if(userFound)
            { 
                return true;
            }
            else
            {
                throw new Error("No existe cuenta registrada con este usuario/email.");
            }
        }),
    
    check('password')
        .notEmpty().withMessage("Introduce tu contraseña.").bail()
        .custom((value, {req}) => 
        {
            if(userFound && bcrypt.compareSync(value, userFound.password)) return true;
            else throw new Error("Contraseña incorrecta.");
        })
]