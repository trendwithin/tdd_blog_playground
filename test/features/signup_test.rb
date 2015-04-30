require "test_helper"

feature "Home Page Has Signup Link" do
  scenario "Visitor Can Sign Up to Site" do
    visit root_path
    page.must_have_content "Sign Up"
    page.wont_have_content "Goobye All!"
  end
end

feature "Redirect to Sign Up Form" do
  scenario 'Clicking Sign Up Takes Visitor to Form' do
    visit root_path
    click_link 'Sign Up'
    page.must_have_content 'Email'
  end
end

feature "Sign Up User" do
  scenario 'Fill In the Sign Up Form' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    page.must_have_content "Welcome! You have signed up successfully."
  end
end



