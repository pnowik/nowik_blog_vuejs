class Post < ApplicationRecord

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :body, presence: true, length: {minimum: 30, maximum: 5000}
end
