require 'spec_helper'

describe Tutorial do

  it { should belong_to :category}
  it { should belong_to :user }

  it "checks to see if it has been liked by the current user" do
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
end
