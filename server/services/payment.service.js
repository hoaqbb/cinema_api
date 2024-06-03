const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function createPayment(payment) {
    const row = await db.query(`INSERT INTO payment 
                                (payment_id, user_id, amount, total_ticket, date) 
                                VALUES (NULL, '${payment.user.user_id}', 
                                '${payment.amount}', '${payment.total_ticket}', '${payment.date}')`);

    const data = helper.emptyOrRows(row);
    if (data.affectedRows) {
        return data.insertId
    }
    return "Failed!!!";
}

async function getPaymentInfoById(payment_id) {
    const row = await db.query(`SELECT DISTINCT payment.payment_id, 
                                payment.total_ticket, payment.amount, 
                                DATE_FORMAT(payment.date, '%H:%i %d-%m-%Y') AS date,
                                ticket.ticket_name, movie.movie_img, cinema.cinema_name,
                                TIME_FORMAT(movie_show.start_time, '%H:%i') as start_time
                                FROM payment 
                                INNER JOIN ticket ON ticket.payment_id = payment.payment_id
                                INNER JOIN movie_show ON movie_show.show_id = ticket.show_id
                                INNER JOIN cinema ON cinema.cinema_id = movie_show.cinema_id
                                INNER JOIN movie ON movie.movie_id = movie_show.movie_id
                                WHERE payment.payment_id = ${payment_id}`);
    const data = helper.emptyOrRows(row);
    return data;
}

async function getPaymentsByUserId(user_id){
    const sql = `SELECT DISTINCT payment.payment_id, 
                payment.total_ticket, payment.amount, 
                DATE_FORMAT(payment.date, '%H:%i %d-%m-%Y') AS date,
                DATE_FORMAT(STR_TO_DATE(ticket.expiry_date, '%H:%i %d-%m-%Y'), 
                '%d-%m-%Y') AS expiry_date,
                ticket.ticket_name, movie.movie_img, movie.movie_name, cinema.cinema_name,
                TIME_FORMAT(movie_show.start_time, '%H:%i') as start_time
                FROM payment 
                INNER JOIN ticket ON ticket.payment_id = payment.payment_id
                INNER JOIN movie_show ON movie_show.show_id = ticket.show_id
                INNER JOIN cinema ON cinema.cinema_id = movie_show.cinema_id
                INNER JOIN movie ON movie.movie_id = movie_show.movie_id
                INNER JOIN user ON user.user_id = payment.user_id
                WHERE user.user_id = ${user_id}
                ORDER BY date DESC`;
    const row = await db.query(sql)
    const data = helper.emptyOrRows(row)
    return data
}

module.exports = {
    createPayment,
    getPaymentInfoById,
    getPaymentsByUserId
};
