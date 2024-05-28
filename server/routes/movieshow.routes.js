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

  router.get("/cinema-showing-movie", async function(req, res, next){
    try{
        res.json(await movieshowService.getCinemaShowingMovie(req.query.movie_id));
    } catch {
        console.error(err.message);
        next(err);
    }
  })

  router.get("/showtimes-movie", async function(req, res, next){
    try {
        // In error => next(): Middleware: Write after handled route
        const data = await movieshowService.getShowtimesMovie(req.query.movie_id, req.query.cinema_id);
        const listShowtimes = Array.from(data).map((showItem) => {
            const {
                show_id,
                cinema_id,
                cinema_name,
                start_time,
                movie_id, 
                movie_name,
                room_id
            } = showItem;
            return {
                show_id,
                start_time,
                cinema: {
                    cinema_id,
                    cinema_name
                },
                movie: {
                    movie_id,
                    movie_name
                },
                room: {
                    room_id
                }
            };
        });
        res.json(listShowtimes);
    //   res.json(await movieshowService.findShow());
    } catch (err) {
      console.error(err.message);
      next(err);
    }
  });
  
  module.exports= router;