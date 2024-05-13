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

module.exports= router;