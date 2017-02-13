$redis = Redis::Namespace.new("hotreads:#{Rails.env}", redis: Redis.new)
