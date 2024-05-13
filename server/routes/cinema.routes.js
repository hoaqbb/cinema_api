const express = require('express');
const router = express.Router();
const cinemaService = require('../services/cinema.service');

//GET cinemas
router.get("/cinemas", async function(req, res, next){
  try {
    res.json(await cinemaService.getCinemas());
  } catch (err) {
    console.error(err.message);
    next(err);
  }
});

module.exports= router;