const express = require("express");
const router = express.Router();
const paymentService = require("../services/payment.service");

router.post("/create-payment", async function (req, res, next) {
    try {
        
        const newPayment = {
            user:{
                "user_id": req.body.user.user_id
            },
            "amount": req.body.amount,
            "total_ticket": req.body.total_ticket,
            "date": req.body.date
        };
        res.json(await paymentService.createPayment(newPayment));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

// router.get("/get-payments-by-user-id", async function (req, res, next){
//     try {
//         const data = await paymentService.getPaymentsByUserId(req.query.user_id);
//         const listPayment = Array.from(data).map((payment) => {
//             const {
//                 payment_id,
//                 total_ticket,
//                 amount,
//                 date,
//                 ticket_name,
//                 movie_img,
//                 cinema_name,
//                 start_time
//             } = payment;
//             return {
//                 payment_id,
//                 total_ticket,
//                 amount,
//                 date,
//                 ticket:{
//                     ticket_name
//                 },
//                 movieShow: {
//                     start_time,
//                     movie:{
//                         movie_img
//                     },
//                     cinema: {
//                         cinema_name
//                     },
//                 }
//             };
//         });
//         res.json(listPayment);
//     } catch (err) {
//         console.error(err.message);
//         next(err);
//     }
// });

module.exports = router;