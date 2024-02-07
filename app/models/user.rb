class User < ApplicationRecord
<<<<<<< HEAD
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id', dependent: :destroy, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
=======
>>>>>>> 68181703ed486838f21f155818b662f67c397438

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
