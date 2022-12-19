const fs = require('fs');
const path = require('path');
const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const { associations, filters, createError } = require('../helpers');

const dataParser = require('../data/dataParser');
const session = require('express-session');
const db = require('../database/models');
const users = dataParser.loadData('users.json');
const products = dataParser.loadData('products.json');
const categories = dataParser.loadData('categories.json');
const tags = dataParser.loadData('tags.json');
const usersFilePath = path.join(__dirname, '../data/users.json');

const admins = dataParser.loadData('admins.json');
const isAdmin = (user) => {
    return admins.find(a => a.userName === user.userName)
}

module.exports =
{
    users: async (req, res) => {
        try 
        {
            const users = await db.users.findAll(associations.get('avatar'));
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            return res.render('./users/users', {users, categories, tags});
        } 
        catch (error) 
        {
            console.log(error);
            return res.send(error);
        }
    },
    userProfile: async (req, res) =>
    {
        try 
        {
            const userProfile = await db.users.findOne(
                filters.where('username', req.params.username, 
                'avatar', 'subscription', 'tagsFollowing'));

            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            if(!userProfile) { throw createError(404, 'Usuario no existe') }

            return res.render('./users/profile', {userProfile, categories, tags});
        } 
        catch (error) 
        {
            console.log(error);
            res.send(error);
        }
    },
    edit: async (req, res) => {
        try 
        {
            const user = await db.users.findOne(filters.where("username", req.params.username, 
                'avatar', 'subscription', 'tagsFollowing'));
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();

            if(!user) throw createError(404, 'Usuario no existe.');

            return res.render('./users/editProfile', {user, categories, tags});
        } 
        catch (error) 
        {
            console.log(err); 
            res.send(err);
        }
    },
    update: async(req, res) => {
        let errors = validationResult(req);
        if(!errors.isEmpty())
        {
            let profileOld = req.body    
            let profileErrors= errors.mapped()

            return res.render("./users/editProfile", 
            { users, products, categories, tags, profileOld, profileErrors, user: users[userIndex] })
        }

        try 
        {
            const user = await db.users.findOne(
                filters.where('username', req.params.username));
            
            if(req.file)
            {
                const avatar = await db.userimages.findOne(filters.where('user_id', user.id));

                if(avatar)
                {
                    await avatar.update(
                        {
                            filename: req.file.filename
                        });
                }
                else
                {
                    await db.userimages.create(
                        {
                            filename: req.file.filename,
                            user_id: user.id
                        }
                    )
                }
            }

            await user.update(
                {
                    firstName: req.body.firstName.trim(),
                    lastName: req.body.lastName.trim(),
                    email: req.body.email.trim(),
                }
            )
            
            return res.redirect("/user/" + user.username);
        } 
        catch (error) 
        {
            console.log(err);
            res.send(err);
        }
    },
    deleteUser: (req, res) => { //! I'll start from here
        db.users.destroy(
            {
                where:
                {
                    username: req.params.username
                }
            })
            .then(() => res.redirect('/'))
            .catch(err => { console.log(err); res.send(err)});
    },
    processRegister: async (req, res) => {
        let errors = validationResult(req);

        if(!errors.isEmpty())
        {
            req.session.registerErrors = errors.mapped();
            req.session.registerOld = req.body;
            return res.redirect('back');
        }

        try 
        {
            await db.users.create(
                {
                    username: req.body.username.trim(),
                    firstName: "Sin nombre",
                    lastName: "Sin apellido",
                    email: req.body.email.toLowerCase().trim(),
                    password: bcrypt.hashSync(req.body.password.trim(), 10),
                    isAdmin: 0,
                    subscription_id: null,
                }
            );

            req.session.user =
            {
                username: req.body.username.trim(),
                image: 'AvatarDefault.jpeg',
                admin: 0
            }

            return res.redirect('back');
        } 
        catch (error) 
        {
            console.log(error);
            res.send(error);
        }
    },
    processLogin: async (req, res) => {
        let errors = validationResult(req);

        if(!errors.isEmpty())
        {
            req.session.loginErrors = errors.mapped();
            req.session.loginOld = req.body;
            return res.redirect('back');
        }

        try 
        {
            let user;

            req.body.username.includes('@') ?
                user = await db.users.findOne(filters.where('email', req.body.username.toLowerCase().trim(), 'avatar'))
                : user = await db.users.findOne(filters.where('username', req.body.username.toLowerCase().trim(), 'avatar'));
            
            req.session.user =
            {
                username: user.username,
                image: user.avatar ? user.avatar.filename : 'AvatarDefault.jpeg',
                admin: user.isAdmin
            }

            if (req.body.rememberMe) 
            {
                res.cookie('Shinsekai', req.session.user,
                    {
                        maxAge: 5000 * 60
                    })
            }
                /* CARRITO */
            /* No hay, no existe, no me dio la gana */
             
            return res.redirect('back');
        } 
        catch (error) 
        {
            console.log(error);
            res.send(error);
        }
    },
    logout: (req, res) => {
        req.session.destroy();
        res.clearCookie('Shinsekai');

        return res.redirect('/');
    }
}