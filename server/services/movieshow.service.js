const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function findShow() {
    const row = await db.query(`SELECT * FROM movie_show 
                                INNER JOIN movie ON 
                                movie_show.movie_id = movie.movie_id;`);
    const data = helper.emptyOrRows(row);
    return data;
}

async function getCinemaShowingMovie(movie_id) {
    const row = await db.query(`SELECT DISTINCT cinema.cinema_id, cinema.cinema_name
                              FROM movie_show
                              JOIN cinema ON 
                              cinema.cinema_id = movie_show.cinema_id
                              WHERE movie_show.movie_id=${movie_id};`);
    const data = helper.emptyOrRows(row);
    return data;
}

async function getShowtimesMovie(movie_id, cinema_id) {
    const row =
        await db.query(`SELECT movie_show.show_id, 
                        TIME_FORMAT(start_time, '%H:%i') as start_time, 
                        cinema.cinema_name, movie.movie_name,
                        movie_show.room_id,
                        movie_show.movie_id, movie_show.cinema_id 
                        FROM movie_show
                        INNER JOIN cinema ON cinema.cinema_id = movie_show.cinema_id
                        INNER JOIN movie ON movie.movie_id = movie_show.movie_id
                        WHERE movie_show.movie_id=${movie_id} 
                        AND cinema.cinema_id=${cinema_id}`);
    const data = helper.emptyOrRows(row);
    return data;
}

module.exports = {
    findShow,
    getCinemaShowingMovie,
    getShowtimesMovie
};
