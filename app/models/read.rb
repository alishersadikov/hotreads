class Read < ApplicationRecord

  def self.hotreads
    where('created_at > ?', Time.now - 1.day).
    select('reads.url, count(reads.id) AS hit_count').
    group('reads.url').
    order("hit_count DESC").
    limit(10)
  end
end
