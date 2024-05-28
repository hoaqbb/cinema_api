const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function createTicket(listTicket) {
    //[[ 1, 1, 33, 43, 'abc', '2024/05/25' ],
    //    [ 1, 2, 33, 43, 'abc', '2024/05/25' ]]
    //tao place holder dua tren mang tren
    //(?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?)
    const placeholders = listTicket.map(() => "(?, ?, ?, ?, ?, ?)").join(", ");
    const sql = `INSERT INTO ticket (user_id, seat_id, 
        payment_id, show_id, ticket_name, expiry_date) VALUES ${placeholders}`;

    const flattenedValues = listTicket.flat();

    const row = await db.query(sql, flattenedValues);
    if (row.affectedRows) {
        return "Ticket created successfully!!!";
    }
    return "Failed!!!";
}

async function getTicketsByUserId(user_id) {
    const sql = `SELECT ticket.ticket_id, 
                ticket.ticket_name, movie.movie_img, cinema.cinema_name,
                TIME_FORMAT(movie_show.start_time, '%H:%i') as start_time, 
                ticket.expiry_date, room_seat.seat_name
                FROM ticket 
                INNER JOIN room_seat ON room_seat.seat_id = ticket.seat_id
                INNER JOIN cinema_room ON cinema_room.room_id = room_seat.room_id
                INNER JOIN movie_show ON movie_show.show_id = ticket.show_id
                INNER JOIN cinema ON cinema.cinema_id = cinema_room.cinema_id
                INNER JOIN movie ON movie.movie_id = movie_show.movie_id
                INNER JOIN user ON user.user_id = ticket.user_id
                WHERE user.user_id = ${user_id}
                ORDER BY ticket.expiry_date DESC`;

    const row = await db.query(sql);
    const data = helper.emptyOrRows(row);
    return data;
}

module.exports = {
    createTicket,
    getTicketsByUserId
};
