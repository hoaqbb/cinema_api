const config = {
    db: {
      /* don't expose password or any sensitive info, done only for demo */
      host: "localhost",
      user: "admin",
      password: "admin",
      database: "db_cinema",
      connectTimeout: 60000
    },
    listPerPage: 10,
  };
  module.exports = config;