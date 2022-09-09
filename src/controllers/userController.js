const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const dataParser = require('../data/dataParser');
const users = dataParser.loadData('users.json');
const products = dataParser.loadData('products.json');
const categories = dataParser.loadData('categories.json');
const tags = dataParser.loadData('tags.json');

module.exports = 
{
    users: (req, res) =>
    {
        return res.render('./users/users', { users, products, categories, tags});
    },
    userProfile: (req, res) =>
    {
        return res.send("Implementación pendiente");
    },
    edit: (req, res) =>
    {
        return res.send("Implementación pendiente");
    },
    update: (req, res) =>
    {
        return res.send("Implementación pendiente");
    },
    deleteUser: (req, res) =>
    {
        const userIndex = users.findIndex((u) => u.userName === req.params.userName);
        users.splice(userIndex, 1);

        dataParser.saveData(users, 'users.json');
        return res.redirect('/');
    },
    editProfile: (req, res)=>{
        return res.render("editProfile")
    },
    processRegister: (req, res) =>
    {
        let errors = validationResult(req);

        if(errors.isEmpty())
        {
            //* Create user
            const newUser= 
            {
                userName: req.body.userName.trim(),
                firstName: "",
                lastName: "",
                email: req.body.email.trim().toLowerCase(),
                password: bcrypt.hashSync(req.body.password, 10),
                image: "default-img.jpg"
            }

            //* Create session
            req.session.user =
            {
                userName: newUser.userName,
                image: newUser.image
            }

            //* Save files
            users.push(newUser);
            dataParser.saveData(users, 'users.json');
        }
        else
        {
            req.session.registerErrors = errors.mapped();
            req.session.registerOld = req.body;
        }

        return res.redirect('back');
    },
    processLogin: (req, res) =>
    {
        let errors = validationResult(req);

        if(errors.isEmpty())
        {
            //* Get user
            let user;
            req.body.userName.includes('@') ? 
                user = users.find(u => u.email === req.body.userName.trim().toLowerCase())
                : user = users.find(u => u.userName === req.body.userName.trim());

            //! Check admin permissions [ADD IT HERE]
            //! Check admin permissions [ADD IT HERE]
            //! Check admin permissions [ADD IT HERE]

            //* Create session
            req.session.user =
            {
                userName: user.userName,
                image: user.image
            }
        }
        else
        {
            req.session.loginErrors = errors.mapped();
            req.session.loginOld = req.body;
        }

        return res.redirect('back');
    }
}