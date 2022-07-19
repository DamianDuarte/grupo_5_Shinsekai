const express = require("express");
const path = require('path');
const app = express();
const port = 3030;

app.use(express.static('public'));

app.get("/", (req, res) => res.sendFile(path.join(__dirname, 'views', 'home.html')));
app.get("/cart", (req, res) => res.sendFile(path.join(__dirname, 'views', 'cart.html')));
app.get("/details", (req, res) => res.sendFile(path.join(__dirname, 'views', 'details.html')));
app.get("/login", (req, res) => res.sendFile(path.join(__dirname, 'views', 'login.html')));
app.get("/register", (req, res) => res.sendFile(path.join(__dirname, 'views', 'register.html')));
app.get("/eric", (req, res) => res.sendFile(path.join(__dirname, 'views', 'eric.html')));

app.listen(port, () =>
{
    console.log("Servidor corriendo (http://localhost:" + port + ")");
});