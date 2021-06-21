var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

router.post('/', function(req, res, next) {
    console.log(req.body)
    const codice_fiscale = req.body.CF;
    //const categoria = req.body.categoria;
    const TEAM = req.body.TEAM;
    //const polo_vaccinale= req.body.polo_vaccinale;
    //const data = req.body.data;
    //const ora = req.body.ora;
    //const vaccino= req.body.vaccino;
    const id_erogazione = req.body.id_erogazione
    //TODO encrypt per generare numero prenotazione a 14 cifre
    var numero_richiesta = '00000000000002'
    //TODO fail per id_erogazione duplicata
    
    const sql = 'INSERT INTO `prenotazioni`(`codice_fiscale`, `team`, `numero_richiesta`, `id_erogazione`) VALUES (\''+codice_fiscale+'\',\''+ TEAM +'\', \''+ numero_richiesta +'\',\''+id_erogazione+'\')'

    connection.query(sql, function (error, results, fields) {
        console.log("prenota appuntamento GET")
        res.render('prenota-appuntamento', { title: 'Home' });
    });
});

module.exports = router;