const { check } = require('express-validator');
const { unlink, unlinkSync } = require('fs');
const path = require('path');


module.exports = [
    check('name')
        .notEmpty()
        .withMessage('Debes introducir el nombre del producto.')
        .bail()
        .isLength({ min: 5, max: 75 })
        .withMessage('El nombre debe contener entre 5 y 75 caracteres'),

    check('price')
        .notEmpty()
        .withMessage('Debes introducir el precio del producto.')
        .bail()
        .isNumeric({ no_symbols : true })
        .withMessage('El precio debe ser un numero y no puede incluir símbolos.'),

    check('discount')
        .isNumeric({ no_symbols : true })
        .withMessage('El descuento debe ser un numero entero y no incluir símbolos.')
        .bail()
        .isInt({ max: 100 })
        .withMessage('El descuento debe ser un número entero no mayor a 100.'),

    check('description')
        .notEmpty()
        .withMessage('El nombre del producto es obligatorio.')
        .bail()
        .isLength({ min: 20 })
        .withMessage('La descripción debe tener al menos 20 caracteres de largo.'),

    check('images')
        .custom((value, { req }) =>
        {
            const images = req.files;

            images.forEach(img => {
                const extension = (path.extname(img.filename)).toLowerCase();
                switch (extension) {
                    case '.jpg':
                    case '.jpeg':
                    case '.png':
                    case '.gif':
                        break;
                    default:
                        images.forEach(i => unlinkSync(i.path))
                        throw new Error("Solo se permiten los formatos JPG, JPEG, PNG y GIF para imagenes.");
                }
            })

            return true;
        })
]