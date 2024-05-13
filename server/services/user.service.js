const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function authenticate(username){
    const row = await db.query(`SELECT username, password FROM user 
                                WHERE username=${username}`);
    const data = helper.emptyOrRows(row);

    return data[0];
  }

  module.exports = {
    authenticate
  }