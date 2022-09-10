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
        return res.render("./users/editProfile", { users, products, categories, tags})
    }
}