# require 'redis'
# require 'redis/objects'

# config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]

# Redis.current = Redis::Namespace.new("#{config['namespace']}".to_sym,
#  redis: Redis.new(host: config['host'], port: config['port']))

Redis.current = Redis.new

# $redis = Redis.new


