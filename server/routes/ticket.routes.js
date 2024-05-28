const express = require("express");
const router = express.Router();
const ticketService = require("../services/ticket.service");

router.post("/create-ticket", async function (req, res, next) {
    try {
        const listTicket = req.body
        const values = listTicket.map((listTicket) => [
            listTicket.user.user_id,
            listTicket.seat.seat_id,
            listTicket.payment.payment_id,
            listTicket.movieShow.show_id,
            listTicket.ticket_name,
            listTicket.expiry_date
        ]);
        console.log(values);
        res.json(await ticketService.createTicket(values));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

router.get("/get-tickets-by-user-id", async function(req, res, next){
    try {
        const data = await ticketService.getTicketsByUserId(req.query.user_id);
        const listTicket = Array.from(data).map((ticket) => {
            const {
                ticket_id,
                ticket_name,
                movie_img,
                cinema_name,
                start_time,
                expiry_date, 
                seat_name
            } = ticket;
            return {
                ticket_id,
                ticket_name,
                expiry_date,
                
                movieShow: {
                    start_time,
                    movie:{
                        movie_img
                    },
                    cinema: {
                        cinema_name
                    },
                },
                seat:{
                    seat_name
                }
            };
        });
        res.json(listTicket);
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

module.exports = router;
