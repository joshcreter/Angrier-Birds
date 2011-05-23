uri = URI.parse(ENV["REDISTOGO_URL_CUSTOM"])
#REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
REDIS = Redis.new(:host => uri.host)
