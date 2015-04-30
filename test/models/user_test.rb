require "test_helper"

describe User do
  let(:user) { User.new(email: 'me@you.com', password: 'password', role: 'admin') }

  it "must be valid" do
    user.must_be :valid?
  end
end
