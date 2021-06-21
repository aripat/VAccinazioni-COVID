var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

/* GET users listing. */

router.get('/poli-vaccinali.html', function(req, res, next) {
  const codice_fiscale = req.query.CF;
  const team = req.query.TEAM;
  const categoria = req.query.categoria;
  console.log(codice_fiscale,  team, categoria)
  connection.query('SELECT * FROM erogazione, polo_per_categoria WHERE erogazione.polo_vaccinale = polo_per_categoria.polo_vaccinale AND categoria=\''+categoria+'\' ORDER BY erogazione.data, erogazione.ora', function (error, results, fields) {
    // error will be an Error if one occurred during the query
    // results will contain the results of the query
    // fields will contain information about the returned results fields (if any)
    res.render('poli-vaccinali', {title: 'Poli Vaccinali', 
                                  results: results, 
                                  identity:{"codice_fiscale": codice_fiscale, "team": team, "categoria":categoria}
                                });
  });
});

router.get('/inserisci-dati', function(req, res, next) {
  res.render('inserisci-dati-prenotazione', { title: 'Inserimento'});
});

module.exports = router;