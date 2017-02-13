class RecentLinks
  KEY = "recent_links" # redis key
  STORE_LIMIT = 10      # how many posts should be kept

  # Get list of recent posts from redis
  # Since redis stores data in binary text format
  # we need to parse each list item as JSON
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit-1).map do |raw_link|
      JSON.parse(raw_link).with_indifferent_access
    end
  end

  # Push new post to list and trim it's size
  # to limit required storage space
  # `raw_link` is already a JSON string
  # so there is no need to encode it as JSON
  def self.push(raw_link)
    $redis.lpush(KEY, raw_link)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end
end
