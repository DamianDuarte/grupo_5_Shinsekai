const fs = require('fs');
const path = require('path');
const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const dataParser = require('../data/dataParser');
const session = require('express-session');
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
    users: (req, res) => {
        return res.render('./users/users', { users, products, categories, tags, isAdmin });
    },
    userProfile: (req, res) =>
    {
        const userProfile = users.find(u => u.userName === req.params.username);

        if(userProfile) return res.render('./users/profile', {users, products, categories, tags, userProfile});
        else res.redirect('/');
    },
    edit: (req, res) => {
        let user = users.find(u => u.userName === req.params.username)
        return res.render("./users/editProfile", { users, products, categories, tags, user })
    },
    update: (req, res) => {
        const userIndex = users.findIndex((u) => u.userName === req.params.username);
        let userImg = "AvatarDefault.jpeg";
        req.file ? userImg = req.file.filename : userImg = users[userIndex].image;

        let errors = validationResult(req);
        if (errors.isEmpty()) {

            users[userIndex] = {
                userName: req.params.username,
                firstName: req.body.firstName.trim(),
                lastName: req.body.lastName.trim(),
                email: req.body.email.trim(),
                password: req.body.password.trim(),
                image: userImg
            }
            fs.writeFileSync(usersFilePath, JSON.stringify(users, null, 3), 'utf-8');
            return res.redirect("/user/" + users[userIndex].userName);
        }else{
            let profileOld = req.body    
            let profileErrors= errors.mapped()
            res.send(profileErrors)
            return res.render("./users/editProfile", { users, products, categories, tags, profileOld, profileErrors, user: users[userIndex] })
        }

    },
    deleteUser: (req, res) => {
        const userIndex = users.findIndex((u) => u.userName === req.params.username);
        users.splice(userIndex, 1);

        dataParser.saveData(users, 'users.json');
        return res.redirect('/');
    },
    editProfile: (req, res)=>{
        return res.render("./users/editProfile", { users, products, categories, tags})
    },
    processRegister: (req, res) => {
        let errors = validationResult(req);

        if (errors.isEmpty()) {
            //* Create user
            const newUser =
            {
                userName: req.body.userName.trim(),
                firstName: "",
                lastName: "",
                email: req.body.email.trim().toLowerCase(),
                password: bcrypt.hashSync(req.body.password, 10),
                image: "default-img.jpg"
            }

            //* Check admin permission
            const admin = isAdmin(newUser) ? true : false;

            //* Create session
            req.session.user =
            {
                userName: newUser.userName,
                image: newUser.image,
                admin
            }

            //* Save files
            users.push(newUser);
            dataParser.saveData(users, 'users.json');
        }
        else {
            req.session.registerErrors = errors.mapped();
            req.session.registerOld = req.body;
        }

        return res.redirect('back');
    },
    processLogin: (req, res) => {
        let errors = validationResult(req);

        if (errors.isEmpty()) {
            //* Get user
            let user;
            req.body.userName.includes('@') ?
                user = users.find(u => u.email === req.body.userName.trim().toLowerCase())
                : user = users.find(u => u.userName === req.body.userName.trim());

            //* Check admin permission
            const admin = isAdmin(user) ? true : false;

            //* Create session
            req.session.user =
            {
                userName: user.userName,
                image: user.image,
                admin
            }

            //* RememberMe Cookie
            if (req.body.rememberMe) {
                res.cookie('Shinsekai', req.session.user,
                    {
                        maxAge: 5000 * 60
                    })
            }
        }
        else {
            req.session.loginErrors = errors.mapped();
            req.session.loginOld = req.body;
        }

        return res.redirect('back');
    },
    logout: (req, res) => {
        req.session.destroy();
        res.clearCookie('Shinsekai');

        return res.redirect('/');
    }

}