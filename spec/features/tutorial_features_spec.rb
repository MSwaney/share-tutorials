require 'spec_helper'

feature 'pagination' do
  scenario 'user visits tutorials index page' do
    31.times { FactoryGirl.create(:tutorial) }
    visit tutorials_path
    page.should have_content "»"
  end 
end

feature 'user can post a tutorial' do
  scenario 'user submits a valid tutorial', js: true do
    sign_up_and_log_in
    click_on("Submit A Tutorial!")
    fill_in 'Description', :with => 'new tutorial hey'
    fill_in 'Link', :with => 'hello.com'
    select('Ruby', :from => 'Category')
    click_button("Submit Tutorial")
    page.should have_content "Your tutorial has been added"
  end

  scenario 'user submits a tutorial without category', js: true do
    sign_up_and_log_in
    click_on("Submit A Tutorial!")
    fill_in 'Description', :with => 'new tutorial hey'
    fill_in 'Link', :with => 'hello.com'
    click_button("Submit Tutorial")
    page.should have_content "Category can't be blank"
  end
end 
