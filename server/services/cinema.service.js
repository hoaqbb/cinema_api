const db = require('./db');
const helper = require('../helper');
const config = require('../config');

//lay ds cinema
async function getCinemas(){
    const rows = await db.query(`SELECT cinema_id, cinema_name, 
                                address, cinema_img, 
                                sdt FROM cinema`);
    const data = helper.emptyOrRows(rows);
    return data;
  }

  module.exports = {
    getCinemas
  }