const express = require("express");
const router = express.Router();
const movieService = require("../services/movie.service");

//GET movies

// router.get("/show", awaitHandlerFactory(MovieController.getAllMovies))



///:status
router.get("/movies", async function (req, res, next) {
    try {
        res.json(await movieService.getMovies(req.query.status));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

// :id || /show => id = show => running => crash
router.get("/movie-by-id", async function (req, res, next) {
    try {
        // console.log(req.params)
        res.json(await movieService.getMovieById(req.query.movie_id));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

// router.get("/authenticate", async function (req, res, next) {
//     try {
//         res.json(await movieService.findUserByUsername(req.query.username));
//     } catch (err) {
//         console.error(err.message);
//         next(err);
//     }
// });

module.exports = router;
