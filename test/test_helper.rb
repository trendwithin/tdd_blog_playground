ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/pride"
require "minitest/rails/capybara"
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# User Sign In
def sign_in
  visit new_user_session_path
  fill_in "Email", with: users(:vic).email
  fill_in "Password", with: 'password'
  click_on "Log in"
end
