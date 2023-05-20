class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :delete_all
  has_many :comments, foreign_key: :author_id, dependent: :delete_all
  has_many :likes, foreign_key: :author_id, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 250 }

  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def latest_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
