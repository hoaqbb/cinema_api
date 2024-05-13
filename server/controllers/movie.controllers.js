const movieService = require("../services/movie.service");

class MovieController {
    static getAllMovies = async (req, res, next) => {
        // In error => next(): Middleware: Write after handled route
        const data = await movieService.findShow();
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
    };

    static getMoviesByStatus = async (req, res, next) => {
        // In error => next(): Middleware: Write after handled route
        const data = await movieService.findShow();
    };
}

module.exports = MovieController;
