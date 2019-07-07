class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  #default_scope -> { where(published: true) }
  validates :body, presence: true, length: {minimum: 1, maximum: 400}
end
