class Post < ApplicationRecord

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end


  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :subtitle, presence: true, length: {minimum: 30, maximum: 300}
  validates :body, presence: true, length: {minimum: 100, maximum: 5000}
end
