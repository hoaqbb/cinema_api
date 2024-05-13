const db = require('./db');
const helper = require('../helper');
const config = require('../config');

// async function getMovieShowtimes(status){
//     const rows = await db.query(`SELECT movie_id, movie_name, 
//                                 movie_img FROM movie 
//                                 WHERE status=${status}`);
//     const data = helper.emptyOrRows(rows);
//     return data;
//   }

async function findShow(){
    const row = await db.query(`SELECT * FROM movie_show 
                                INNER JOIN movie ON 
                                movie_show.movie_id = movie.movie_id;`);
    const data = helper.emptyOrRows(row);
    return data;
  }

async function getMovieShowtimes(movie_id){
  const row = await db.query(`SELECT cinema.cinema_name, movie_show.start_time, 
                              movie_show.movie_id, movie_show.cinema_id 
                              FROM movie_show
                              INNER JOIN cinema ON 
                              cinema.cinema_id = movie_show.cinema_id
                              WHERE movie_show.movie_id=${movie_id};`);
  const data = helper.emptyOrRows(row);
  return data;
}

  module.exports = {
    findShow,
    getMovieShowtimes
  }