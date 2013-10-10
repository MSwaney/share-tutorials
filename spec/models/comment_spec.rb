require 'spec_helper'

describe Comment do
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
  it { should belong_to :tutorial }
  it { should belong_to :user }

  it "checks to see if a comments are sorted by date" do
    user = User.create(name: 'matt', email: 'matt@example.com', password: '1234', password_confirmation: '1234')
    category = Category.create(name: "Ruby", slug: "Ruby")
    tutorial = Tutorial.create(description: 'Things', link: 'www.example.com', user_id: 21, category_id: category.id)
    comment1 = user.comments.create(content: "Great tutorial", tutorial_id: tutorial.id)
    comment2 = user.comments.create(content: "Awesome", tutorial_id: tutorial.id)
    Comment.sort_order.first.should eq comment2  
  end  
end  