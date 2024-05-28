const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function authenticate(username) {
    const row = await db.query(`SELECT user_id, username, password FROM user 
                                WHERE username=${username}`);
    const data = helper.emptyOrRows(row);
    return data[0];
}

async function createUser(user) {
    const sql = `INSERT INTO user(user_id, fullname, 
                username, password, email, gender) 
                VALUES (null,'${user.fullname}','${user.username}',
                '${user.password}','${user.email}','${user.gender}')`;

    const rs = await db.query(sql);
    if (rs.affectedRows) {
        msg = "User created successfully!!!";
    }
    return { msg };

    // json // {username, email } =
}

async function getUserInfo(user_id){
    const row = await db.query(`SELECT user_id, fullname, email 
                                FROM user WHERE user_id=${user_id}`)
    const data = helper.emptyOrRows(row)
    return data[0]
}

module.exports = {
    authenticate,
    createUser,
    getUserInfo
};
