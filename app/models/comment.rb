class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :tutorial
  belongs_to :user

  def self.sort_order
    Comment.all.order('created_at DESC')
  end

  def display_count(tutorial)
    if tutorial.comments > 0
      pluralize(tutorial.comments.count, "comment")
    else
      "Leave the first comment!"
    end
  end
end
