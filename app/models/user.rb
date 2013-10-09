class User < ActiveRecord::Base
  has_secure_password

  has_many :tutorials
  has_many :likes
  has_many :comments

  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates_presence_of :name, presence: :true
  validates_presence_of :email, presence: :true

end
