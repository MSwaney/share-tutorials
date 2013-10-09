class Tutorial < ActiveRecord::Base
  validates :category, presence: true
  validates :link, presence: true
  validates :description, presence: true, length: {maximum: 75}
  has_many :likes
  has_many :comments
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

  def liked_by(user)
    Like.where(user_id: user.id, tutorial_id: self.id).count > 0
  end  
     
  def self.sort_order
    Tutorial.all.order('created_at DESC')
  end 
end
