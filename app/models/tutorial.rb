class Tutorial < ActiveRecord::Base
  validates :link, presence: true
  validates :description, presence: true, length: {maximum: 50}
  # has_many :votes
  # has_many :comments, as: :commentable
  # belongs_to :category

  before_save do
    if !self.link.include? "//"
      self.link = 'http://' + self.link
    end
  end

  def ordered_comments
     self.comments.order("created_at DESC")
   end
end
