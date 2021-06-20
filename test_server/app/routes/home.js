var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/home', function(req, res, next) {
  res.render('index', { title: 'Home' });
});

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Home' });
});

router.get('/error_page', function(req, res, next) {
  res.render('error', { title: 'Error' });
});

module.exports = router;
