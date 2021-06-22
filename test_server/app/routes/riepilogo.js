var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

/* GET users listing. */
console.log("riepilogo loaded")

router.get('/inserisci-dati', function(req, res, next) {
    res.render('inserisci-dati-riepilogo', { title: 'Inserimento' });
  });


router.get('/', function(req, res, next) {
    const codicefiscale = req.query.CF
    const team = req.query.TEAM
    const numero_richiesta = req.query.NUMERO_RICHIESTA
    
    const sql = 'SELECT * FROM prenotazioni, erogazione WHERE codice_fiscale=\''+codicefiscale +'\' AND team=\''+team +'\' AND numero_richiesta =\''+numero_richiesta +'\' AND erogazione.id_erogazione = prenotazioni.id_erogazione;'
    connection.query(sql, function (error, results, fields) {
        //if (error) throw error;
        console.log(sql);
        console.log(results);
        res.render('riepilogo', { title: 'Riepilogo', results: results });
    });
});

router.delete('/cancella-prenotazione', function(req, res, next) {
    const codicefiscale = req.query.CF
    const team = req.query.TEAM
    const numero_richiesta = req.query.NUMERO_RICHIESTA
    console.log(codicefiscale, numero_richiesta);

    const sql = "DELETE FROM `prenotazioni` WHERE `numero_richiesta` = \'"+numero_richiesta+"\';"
    connection.query(sql, function (error, results, fields) {
        if (error) throw error;
        console.log(results)
        res.sendStatus(200);
    });
});

module.exports = router;