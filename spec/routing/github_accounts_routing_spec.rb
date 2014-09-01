require 'rails_helper'

RSpec.describe GithubAccountsController, :type => :routing do
  describe "routing" do
    it "should route to #show" do
      expect(get("/github_accounts/1")).to route_to("github_accounts#show", :id => "1")
    end

    it "should route to #index" do
      expect(get("/github_accounts")).to route_to("github_accounts#index")
    end

    it "should route root to #index" do
      expect(get("/")).to route_to("github_accounts#index")
    end
  end
end
