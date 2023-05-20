class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id, dependent: :delete_all
  has_many :comments, foreign_key: :post_id, dependent: :delete_all

  after_save :update_post_counter

  validates :title, presence: true
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def latest_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.update(posts_counter: author.posts.all.length)
  end

  private :update_post_counter
end