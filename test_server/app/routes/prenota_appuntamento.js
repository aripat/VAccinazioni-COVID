var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

router.post('/', function(req, res, next) {
    //TODO INSERT
    connection.query('SELECT * FROM erogazione WHERE 1', function (error, results, fields) {
        console.log(results)
        
        console.log("prenota appuntamto GET")
        res.render('prenota_appuntamento', { title: 'Home' });
    });
});

module.exports = router;