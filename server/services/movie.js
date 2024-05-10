const db = require('./db');
const helper = require('../helper');
const config = require('../config');

//lay ds movie theo status
async function getMovies(status){
  const rows = await db.query(`SELECT movie_id, movie_name, 
                              movie_img FROM movie 
                              WHERE status=${status}`);
  const data = helper.emptyOrRows(rows);
  return data;
}

//lay movie bang id
async function getMovieById(movie_id){
  const row = await db.query(`SELECT movie_id, movie_name, movie_img, 
                              description FROM movie 
                              WHERE movie_id=${movie_id}`);
  const data = helper.emptyOrRows(row);
  return data.length > 0 ? data[0] : {};
}

//authenticate
async function findUserByUsername(username){
  const row = await db.query(`SELECT username, password FROM user 
                              WHERE username=${username}`);
  const data = helper.emptyOrRows(row);
  return data.length > 0 ? data[0] : {};
}

module.exports = {
  getMovies,
  getMovieById,
  findUserByUsername
}