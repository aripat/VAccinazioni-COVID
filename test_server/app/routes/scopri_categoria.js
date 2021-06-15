var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/poli_vaccinali.html', function(req, res, next) {
  res.render('poli_vaccinali', { title: 'Home' });
});

module.exports = router;
