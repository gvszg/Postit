class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes
  has_secure_password # it seems no password_confirmation by default 

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}

  before_save :generate_slug

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.username.gsub(" ", "-").downcase
  end
end
