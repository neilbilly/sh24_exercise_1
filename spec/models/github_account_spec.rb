require 'rails_helper'

RSpec.describe GithubAccount , :type => :model do

  context "with a valid user who has some repos" do
    before(:each) do
      @username = 'neilbilly'
      @account = GithubAccount.new(@username)
    end

    it "should return user info from github" do
      expect(@account).to be_present
      expect(@account.user_info.login).to be_present
    end

    it "should return an array of repo language counts" do
      expect(@account.repo_language_counts).not_to be_empty
    end

  end

  context "with a non existent user" do
    before(:each) do
      @username = 'no_way_is_this_a_real_user_zxcv45r'
      @account = GithubAccount.new(@username)
    end

    it "should return a nil value for user_info" do
      expect(@account).to be_present
			expect(@account.user_info).to be_nil
    end

    it "should return an empty array of repo language counts" do
			expect(@account.repo_language_counts).to be_empty
    end
  end

end
