var express = require('express');
const encrypt = require('../crypt/crypt.js');

var router = express.Router();
var connection = require('../connection/makeconnection.js');

router.post('/', function(req, res, next) {
    const codice_fiscale = req.body.CF;
    const categoria = req.body.categoria;
    const TEAM = req.body.TEAM;
    
    const id_erogazione = req.body.id_erogazione
    const recapito = req.body.recapito
    
    const numero_richiesta = encrypt(codice_fiscale+":"+categoria+":"+id_erogazione+":"+Date.now());
        
    const sql = 'INSERT INTO `prenotazioni`(`codice_fiscale`, `recapito`, `team`, `numero_richiesta`, `id_erogazione`) VALUES (\''+codice_fiscale+'\', \''+ recapito +'\', \''+ TEAM +'\', \''+ numero_richiesta +'\',\''+id_erogazione+'\')';
    
    connection.query(sql, function (error, results, fields) {
        if(error){
            console.log(error);
            res.writeHead(302, { 
                Location: 'http://127.0.0.1:8888/scopri-categoria/poli-vaccinali'+'?CF='+codice_fiscale+"&TEAM="+TEAM+"&categoria="+ categoria+"&error=409"});
            res.send();
        }
        else{
            console.log("prenota appuntamento GET")
            res.render('prenota-appuntamento', { title: 'Conferma prenotazione', 
            prenotazione :{
                "CF": req.body.CF,
                "TEAM": req.body.TEAM,
                "categoria": req.body.categoria,
                "polo_vaccinale": req.body.polo_vaccinale,
                "data": req.body.data,
                "ora": req.body.ora,
                "vaccino": req.body.vaccino,
                "numero_richiesta" : numero_richiesta
            }});
        }
    });
});

module.exports = router;