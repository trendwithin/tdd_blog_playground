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
    # situation here
  end
end

feature "Edit Post Link: Available to Admin" do
  scenario "Admin Visits Post Index" do
    sign_in_admin
    visit posts_path
    page.must_have_content "Edit"
  end
end
