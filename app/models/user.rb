class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password # it seems no password_confirmation by default 
end
