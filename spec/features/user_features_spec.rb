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

feature 'user can post a tutorial' do
  scenario 'user submits a valid tutorial' do
    sign_up_and_log_in
    click_on("Submit A Tutorial!")
    fill_in 'Description', :with => 'new tutorial hey'
    fill_in 'Link', :with => 'hello.com'
    select('Ruby', :from => 'Category')
    click_button("Submit Tutorial")
    page.should have_content "Your tutorial has been added"
  end
  scenario 'user submits a tutorial without category' do
    sign_up_and_log_in
    click_on("Submit A Tutorial!")
    fill_in 'Description', :with => 'new tutorial hey'
    fill_in 'Link', :with => 'hello.com'
    click_button("Submit Tutorial")
    page.should have_content "Category can't be blank"
  end

end 

