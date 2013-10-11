class User < ActiveRecord::Base
  has_secure_password

  has_many :tutorials
  has_many :likes
  has_many :comments

  validates_format_of :email, :with => /\A[0-9._%a-z\-]+@(?:[0-9a-z\-]+\.)+[a-z]{2,4}\z/i
  validates_presence_of :name
  validates_presence_of :email

end