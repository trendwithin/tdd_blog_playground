require "test_helper"

feature "Login" do
  scenario "User Logs in successfully" do
    sign_in
    page.must_have_content "Signed in successfully."
  end
end
