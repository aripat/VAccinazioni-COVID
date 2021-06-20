var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

/* GET users listing. */
console.log("riepilogo loaded")
router.get('/', function(req, res, next) {
    console.log("riepilogo GET")
    res.render('riepilogo', { title: 'Riepilogo' });
});

module.exports = router;