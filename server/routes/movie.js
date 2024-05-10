const express = require('express');
const router = express.Router();
const movies = require('../services/movie');

//GET movies
router.get("/movies", async function(req, res, next){
  try {
    res.json(await movies.getMovies(req.query.status));
  } catch (err) {
    console.error(err.message);
    next(err);
  }
});

router.get("/movie-by-id", async function(req, res, next){
  try{
    res.json(await movies.getMovieById(req.query.movie_id));
  } catch(err){
    console.error(err.message);
    next(err);
  }
});

router.get("/authenticate", async function(req, res, next){
  try{
    res.json(await movies.findUserByUsername(req.query.username));
  } catch(err){
    console.error(err.message);
    next(err);
  }
});

module.exports = router;