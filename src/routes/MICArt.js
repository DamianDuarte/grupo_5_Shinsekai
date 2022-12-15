const express = require('express');
const router = express.Router();

// ******* CONTROLLERS REQUIRE ********

const { list, addItem, removeItem, removeAllItems } = require('../controllers/api/apiMICArtController');

//* ************ RUTAS ************

router
.get('/', list)
.post('/add/:id', addItem)
.delete('/remove/:id', removeItem)
.delete('/removeAll', removeAllItems)

module.exports = router;
