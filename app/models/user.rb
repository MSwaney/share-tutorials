class User < ActiveRecord::Base
  has_secure_password

  has_many :tutorials
  has_many :likes

  validates_uniqueness_of :email
end
