const express = require("express");
const app = express();
const port = 3000;
const movieRouter = require("./routes/movie.routes");
const cinemaRouter = require("./routes/cinema.routes");
const movieshowRouter = require("./routes/movieshow.routes")
const userRouter = require("./routes/user.routes")
const roomSeatRouter = require("./routes/roomseat.routes")
const paymentRouter = require("./routes/payment.routes")
const ticketRouter = require("./routes/ticket.routes")

app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);
app.get("/", (req, res) => {
    res.json({ message: "ok" });
});

app.use("/movie/api", movieRouter);
app.use("/cinema/api", cinemaRouter);
app.use("/movieshow/api", movieshowRouter);
app.use("/user/api", userRouter);
app.use("/roomseat/api", roomSeatRouter);
app.use("/payment/api", paymentRouter);
app.use("/ticket/api", ticketRouter);

/* Error handler middleware */
app.use((err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    console.error(err.message, err.stack);
    res.status(statusCode).json({ message: err.message });
    return;
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
