class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :tutorial
  validates :user_id, uniqueness: { scope: :tutorial_id }
end
