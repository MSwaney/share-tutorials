class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :user_id, presence: true
  belongs_to :tutorial
  belongs_to :user

  def self.sort_order
    Comment.all.order('created_at DESC')
  end
end
