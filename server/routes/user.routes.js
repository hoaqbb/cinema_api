const express = require('express');
const router = express.Router();
const userService = require('../services/user.service');

router.get("/authenticate", async function(req, res, next){
    try {
        res.json(await userService.authenticate(req.query.username));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

router.post("/create-account", async function(req, res, next){
    try {
        const newUser = {
            "fullname": req.body.fullname,
            "username": req.body.username,
            "password": req.body.password,
            "email": req.body.email,
            "gender": req.body.gender
        };
        res.json(await userService.createUser(newUser));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
});

router.get("/get-user-info", async function(req, res, next){
    try {
        res.json(await userService.getUserInfo(req.query.user_id));
    } catch (err) {
        console.error(err.message);
        next(err);
    }
})
module.exports= router;