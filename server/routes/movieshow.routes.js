const express = require('express');
const router = express.Router();
const movieshowService = require('../services/movieshow.service');


router.get("/movieshow", async function(req, res, next){
    try {
        // In error => next(): Middleware: Write after handled route
        const data = await movieshowService.findShow();
        const listMovieShow = Array.from(data).map((showItem) => {
            const {
                show_id,
                cinema_id,
                movie_id,
                room_id,
                start_time,
                movie_name,
                status,
                movie_img,
                duration,
                actors,
                directors,
                release_date,
                description,
            } = showItem;
            return {
                show_id,
                cinema_id,
                room_id,
                movie: {
                    movie_id,
                    start_time,
                    movie_name,
                    status,
                    movie_img,
                    duration,
                    actors,
                    directors,
                    release_date,
                    description,
                },
            };
        });
        res.json(listMovieShow);
    //   res.json(await movieshowService.findShow());
    } catch (err) {
      console.error(err.message);
      next(err);
    }
  });

  router.get("/get-movie-showtimes-by-movie_id", async function(req, res, next){
    try {
        // In error => next(): Middleware: Write after handled route
        const data = await movieshowService.findShow();
        const listMovieShow = Array.from(data).map((showItem) => {
            const {
                cinema_name,
                cinema_id,
                start_time,
                movie_name,
            } = showItem;
            return {
                cinema: {
                    cinema_name,
                    cinema_id
                },
                movie_show:{
                    start_time
                },
                movie: {
                    movie_name,
                },
            };
        });
        res.json(listMovieShow);
    //   res.json(await movieshowService.findShow());
    } catch (err) {
      console.error(err.message);
      next(err);
    }
  });
  
  module.exports= router;