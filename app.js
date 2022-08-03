const express = require("express");
const path = require('path');
const app = express();

app.use(express.static('public'));
app.set('puerto', process.env.PORT || 3001);

app.get("/", (req, res) => res.sendFile(path.join(__dirname, 'views', 'home.html')));
app.get("/cart", (req, res) => res.sendFile(path.join(__dirname, 'views', 'cart.html')));
app.get("/details", (req, res) => res.sendFile(path.join(__dirname, 'views', 'details.html')));
app.get("/login", (req, res) => res.sendFile(path.join(__dirname, 'views', 'login.html')));
app.get("/register", (req, res) => res.sendFile(path.join(__dirname, 'views', 'register.html')));
app.get("/eric", (req, res) => res.sendFile(path.join(__dirname, 'views', 'eric.html')));
app.get("/payment", (req, res) => res.sendFile(path.join(__dirname, 'views', 'payment.html')));

app.listen(app.get('puerto'), () =>
{
    console.log("Servidor corriendo (http://localhost:" + app.get('puerto') + ")");
});