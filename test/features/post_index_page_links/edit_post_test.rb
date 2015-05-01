require "test_helper"

feature "Edit Post Link: Unavailable to Guest" do
  scenario "Non-Logged in User Visits Post Index" do
    visit posts_path
    page.must_have_content "Listing Post"
    page.wont_have_content "Edit"
  end
end

feature "Edit Post Link: Available to Authors" do
  scenario "Author Privelaged User Visits Post Index" do
    sign_in_author
    visit posts_path
    page.must_have_content "Edit"
  end
end

feature "Edit Post Link: Authors Limitations" do
  scenario "Authors Can Only Edit Their Own Post" do
    sign_in_author
    visit posts_path
    click_link "Edit"
    fill_in 'Body', with: "Hello World"
    click_button 'Update Post'
    page.must_have_content "Hello World"
  end
end

feature "Edit/Destroy Link: Available to Admin" do
  scenario "Admin Visits Post Index" do
    sign_in_admin
    page.must_have_content "Edit"
    page.must_have_content "Destroy"
  end
end
