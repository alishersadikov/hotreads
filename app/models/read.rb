class Read < ApplicationRecord

  def self.hotreads
    select('reads.url, count(reads.id) AS hit_count').group('reads.url').order("hit_count DESC").limit(10)
  end
end
