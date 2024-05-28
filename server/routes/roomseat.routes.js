const express = require("express");
const router = express.Router();
const roomSeatService = require("../services/roomseat.service");

router.get("/seats-in-a-movie-show", async function (req, res, next) {
    try {
        res.json(await roomSeatService.getSeatsShowById(req.query.show_id));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

router.put("/update-status-seat", async function (req, res, next) {
    try {
        res.json(await roomSeatService.updateStatusSeat(req.query.seat_id));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

router.get("/get-movie-show-info", async function (req, res, next) {
    try {
        const data = await roomSeatService.getMovieShowInfo(
            req.query.seat_id, 
            req.query.show_id);
        const movieShowInfo = Array.from(data).map((showInfo) => {
            const {
                movie_img,
                movie_name,
                cinema_name,
                room_name,
                start_time,
                end_time
            } = showInfo;
            return {
                start_time,
                end_time,
                movie: {
                    movie_name,
                    movie_img
                },
                cinema: {
                    cinema_name
                },
                room: {
                    room_name
                }
            };
        });
        res.json(movieShowInfo[0]);
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

module.exports = router;
