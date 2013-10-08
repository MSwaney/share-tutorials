class Tutorial < ActiveRecord::Base
  validates :link, presence: true
  validates :description, presence: true, length: {maximum: 50}
  has_many :likes
  # has_many :comments, as: :commentable
  belongs_to :category
  belongs_to :user

  before_save do
    if !self.link.include? "//"
      self.link = 'http://' + self.link
    end
  end

  def ordered_comments
     self.comments.order("created_at DESC")
   end

  def liked_by
    Like.find_by(user_id: user.id, tutorial_id: tutorial.id).exist?
  end  
     
end
