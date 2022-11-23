const { hashSync, compareSync } = require("bcryptjs");
const db = require('../../database/models');
const { createError } = require('../../helpers');
const { sign } = require("jsonwebtoken");

module.exports = {
    signUp: async (req, res) => {
        console.log(req.body);
        try {
            const {
                username,
                firstName,
                lastName,
                email,
                password,
                isAdmin,
                subscription_id,
            } = req.body;

            if(!username || !email || !password) throw createError(400, 'Faltan datos');

            const { id, rolId } = await db.users.create({
                username: username && username.trim(),
                email: email && email.trim(),
                password: password && hashSync(password.trim(), 10),
                isAdmin: 0,
            });


            const token = sign(
                {
                    id,
                    rolId,
                },
                process.env.SECRET_KEY_JWT,
                {
                    expiresIn: "1h",
                }
            );

            return res.status(201).json({
                ok: true,
                status: 201,
                data: token,
            });
        } catch (error) {
            return res.status(error.status || 500).json({
                ok: false,
                error: error.message,
            });
        }
    },
 signIn: async (req, res) => {
        try {
            const { email, password } = req.body;

            if(!email || !password) {
                throw createError(404, 'Se require email y password');
            }

            let user = await db.users.findOne({
                where : {
                    email
                }
            });
            if(!user || !compareSync(password, user.password)){
                throw createError(401, 'Credenciales inválidas');
            }

            const token = sign(
                {
                    id : user.id,
                    rolId : user.rolId,
                },
                process.env.SECRET_KEY_JWT,
                {
                    expiresIn: "1h",
                }
            );

            return res.status(200).json({
                ok: true,
                status: 200,
                data: token,
            });


        } catch (error) {
            return res.status(error.status || 500).json({
                ok: false,
                error: error.message,
            });
        }
    },
};