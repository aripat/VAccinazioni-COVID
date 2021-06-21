var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

router.get('/poli-vaccinali', function(req, res, next) {
  const codice_fiscale = req.query.CF;
  const team = req.query.TEAM;
  const categoria = req.query.categoria;
  console.log(codice_fiscale,  team, categoria)

  connection.query('SELECT erogazioni_libere.* FROM polo_per_categoria, (SELECT erogazione.* from erogazione left join prenotazioni on erogazione.id_erogazione = prenotazioni.id_erogazione WHERE prenotazioni.id_erogazione IS NULL) as erogazioni_libere WHERE erogazioni_libere.polo_vaccinale = polo_per_categoria.polo_vaccinale AND categoria=\''+categoria+'\' ORDER BY erogazioni_libere.data, erogazioni_libere.ora', function (error, results, fields) {
    console.log(results);
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