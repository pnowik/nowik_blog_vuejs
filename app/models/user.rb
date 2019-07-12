class User < ApplicationRecord

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :name, :email
  validates_confirmation_of :password
  validates :name, presence: true, length: {maximum: 30}

  enum role:[:standard, :mod, :admin]

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
