require 'spec_helper'

describe Tutorial do

  it { should validate_presence_of :description }
  it { should validate_presence_of :link }
  it { should validate_presence_of :category }
  it { should belong_to :category}
  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :likes }

  it "checks to see if it has not been liked by the current user" do
    user = User.create(name: 'matt', email: 'matt@example.com', password: '1234', password_confirmation: '1234')
    tutorial = Tutorial.create(description: 'Things', link: 'www.example.com', user_id: 21, category_id: 1)
    like = Like.create(tutorial_id: tutorial.id, user_id: 55)
    tutorial.liked_by(user).should eq false
  end  

  it "checks to see if it has been liked by the current user" do
    user = User.create(name: 'matt', email: 'matt@example.com', password: '1234', password_confirmation: '1234')
    tutorial = Tutorial.create(description: 'Things', link: 'www.example.com', user_id: user.id, category_id: 1)
    like = Like.create(tutorial_id: tutorial.id, user_id: user.id)
    tutorial.liked_by(user).should eq true
  end

  it "checks to see if it has been liked by the current user" do
    user = User.create(name: 'matt', email: 'matt@example.com', password: '1234', password_confirmation: '1234')
    category = Category.create(name: 'Ruby', slug: 'Ruby')
    tutorial = Tutorial.new(description: 'Things', link: 'www.example.com', user_id: user.id, category_id: category.id )
    tutorial.save
    tutorial.link.should eq "http://www.example.com"
  end
end
