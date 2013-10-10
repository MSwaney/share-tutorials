require 'spec_helper'

def sign_up_and_log_in
  user = FactoryGirl.create(:user)
  Category.create(name: 'Ruby', slug: 'ruby')
  visit root_path
  click_link "Log In"
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button("Log In")
end