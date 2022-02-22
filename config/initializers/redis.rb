# Use this connection for remote
$redis = Redis.new(url: "redis://:MTMk6a79W0vs11vlO0Q2NBCCDjSfRatg@redis-13574.c56.east-us.azure.cloud.redislabs.com:13574/db0")

# And this connection for local
# $redis = Redis::Namespace.new("redis_with_rails", redis: Redis.new)
