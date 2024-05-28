const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function getSeatsShowById(show_id) {
    const row = await db.query(`SELECT room_seat.seat_id, room_seat.seat_name, 
                                room_seat.seat_status, room_seat.price
                                FROM cinema_room 
                                INNER JOIN movie_show ON movie_show.room_id = cinema_room.room_id 
                                INNER JOIN room_seat ON cinema_room.room_id = room_seat.room_id 
                                WHERE movie_show.show_id = ${show_id}`);
    const data = helper.emptyOrRows(row);
    return data;
}

async function updateStatusSeat(seat_id){

    const sql = `UPDATE room_seat SET seat_status=1 
                WHERE seat_id IN ${seat_id}`;

    const rs = await db.query(sql);

    let msg = 'Error in updating status seat!!!';
    if (rs.affectedRows) {
        return 'Seats updated successfully!!!';
    }
    return { msg };
}

async function getMovieShowInfo(seat_id, show_id){
    const sql = `SELECT DISTINCT movie_name, cinema_name, room_name, 
                TIME_FORMAT(start_time, '%H:%i') as start_time,
                TIME_FORMAT(end_time, '%H:%i') as end_time, movie_img 
                FROM room_seat
                INNER JOIN cinema_room ON cinema_room.room_id = room_seat.room_id 
                INNER JOIN cinema ON cinema.cinema_id = cinema_room.cinema_id 
                INNER JOIN movie_show ON movie_show.room_id = cinema_room.room_id 
                INNER JOIN movie ON movie.movie_id = movie_show.movie_id 
                WHERE seat_id = ${seat_id} 
                AND movie_show.show_id = ${show_id}`;
    const row = await db.query(sql)
    const data = helper.emptyOrRows(row);
    return data;
}
module.exports = {
    getSeatsShowById,
    updateStatusSeat,
    getMovieShowInfo
}