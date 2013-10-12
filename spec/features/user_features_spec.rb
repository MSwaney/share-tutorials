require 'spec_helper'

feature 'sign in to account' do
  scenario 'user enters correct info' do
    sign_up_and_log_in
    page.should have_content "Logged in"
  end

  scenario 'user enters correct info' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => "hello"
    click_button("Log In")
    page.should have_content "invalid"
  end
end

