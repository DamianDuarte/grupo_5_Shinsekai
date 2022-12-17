const express = require('express');
const router = express.Router();

// ******* CONTROLLERS REQUIRE ********

const { list, addItem, removeItem, removeAllItems, addqty, removeqty } = require('../controllers/api/apiMICArtController');

//* ************ RUTAS (/api/MICArt) ************

router
.get('/', list)
.get('/add/:id', addItem)
.get('/addqty/:id', addqty)
.get('/removeqty/:id', removeqty)
.get('/remove/:id', removeItem)
.get('/removeAll', removeAllItems)

module.exports = router;
