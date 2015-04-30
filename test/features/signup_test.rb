require "test_helper"

feature "Home Page Signup Link" do
  scenario "Visitor can sign up to blog" do
    visit root_path
    page.must_have_content "Sign Up"
    page.wont_have_content "Goobye All!"
  end
end

feature "Sign Up Form" do
  scenario 'Click Sign Up takes visitor to form' do
    visit root_path
    click_link 'Sign Up'
    page.must_have_content 'Email'
  end
end
