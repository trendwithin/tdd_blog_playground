require "test_helper"

feature "New Post Link: Unavailable to Guest" do
  scenario "Non-Logged in User Visits Post Index" do
    visit posts_path
    page.must_have_content "Listing Post"
    page.wont_have_content "New Post"
  end
end

feature "New Post Link: Available to Logged in User" do
  scenario 'Verified User Visits Post Index' do
    sign_in_author
    visit posts_path
    page.must_have_content "New Post"
  end
end

feature "New Post Link: Available to Admin" do
  scenario 'Site Admin Visits Post Index' do
    sign_in_admin
    visit posts_path
    page.must_have_content "New Post"
  end
end
