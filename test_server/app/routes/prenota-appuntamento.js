var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

router.post('/', function(req, res, next) {
    //TODO INSERT
    //TODO encrypt per generare numero prenotazione a 14 cifre
    connection.query('SELECT * FROM erogazione WHERE 1', function (error, results, fields) {
        console.log(results)
        
        console.log("prenota appuntamto GET")
        res.render('prenota-appuntamento', { title: 'Home' });
    });
});

module.exports = router;