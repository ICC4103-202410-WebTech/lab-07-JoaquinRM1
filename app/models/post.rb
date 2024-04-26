class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, presence: { message: "Title can't be blank" }
  validates :content, presence: { message: "Content can't be blank" }
  validates :user_id, presence: { message: "User can't be blank" }
  validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count must be greater than or equal to 0" }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count must be greater than or equal to 0" }
  validates :published_at, presence: { message: "Published at can't be blank" }
end
