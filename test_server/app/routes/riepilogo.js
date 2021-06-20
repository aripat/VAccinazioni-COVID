var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

/* GET users listing. */
console.log("riepilogo loaded")
router.get('/', function(req, res, next) {
    const codicefiscale = req.query.CF
    const team = req.query.TEAM
    const numero_richiesta = req.query.NUMERO_RICHIESTA
    
    connection.query('SELECT * FROM prenotazioni, erogazione WHERE codice_fiscale=\''+codicefiscale +'\' AND team=\''+team +'\' AND numero_richiesta =\''+numero_richiesta +'\' AND erogazione.id_erogazione = prenotazioni.id_erogazione;', function (error, results, fields) {
        console.log("riepilogo GET")
        console.log(results)
        res.render('riepilogo', { title: 'Riepilogo', results: results });
    });
});

router.delete('/cancella_prenotazione', function(req, res, next) {
    const codicefiscale = req.query.CF
    const team = req.query.TEAM
    const numero_richiesta = req.query.NUMERO_RICHIESTA
    console.log(codicefiscale, numero_richiesta);
    res.sendStatus(200);
});

module.exports = router;