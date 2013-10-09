class User < ActiveRecord::Base
  has_secure_password

  has_many :tutorials
  has_many :likes

  validates_uniqueness_of :email
  validates_presence_of :name, presence: :true
  validates_presence_of :email, presence: :true

end
