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
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 50 },
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  enum role:[:standard, :mod, :admin]

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
