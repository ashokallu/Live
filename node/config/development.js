var config = {}
config.env = 'development';

config.server = {};
// config.server.host = '0.0.0.0';
// config.server.port = 9292;
config.server.host = '127.0.0.1';
config.server.port = 3001;

config.redis = {};
config.redis.host = 'localhost';
config.redis.port = 6379;
config.redis.options = {};
config.redis.namespace = 'livepoll:votes';
config.redis.message_list = "l_msgs";

module.exports = config;
