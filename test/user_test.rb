require_relative "test_helper"
require_relative "../lib/user"

describe "User" do
  describe "self.get" do
    it "can get a list of users" do
      result = {}
      VCR.use_cassette("list-user-endpoint") do
        result = User.get("https://slack.com/api/users.list")
      end

      expect(result).must_be_kind_of HTTParty::Response
      expect(result["ok"]).must_equal true
    end

    it "raises an error when a call fails" do
      VCR.use_cassette("list-user-endpoint") do
        expect {User.get("https://slack.com/api/bogus.call")}.must_raise SlackAPIError
      end
    end
  end
end