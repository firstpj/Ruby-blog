class User < ApplicationRecord

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
