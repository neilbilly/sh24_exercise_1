require 'rails_helper'

feature "The Lookup Repo languages feature" do
  shared_examples "a show page" do
    it "should display account infomation" do
      expect(current_path).to eq github_account_path(@username)
      expect(page).to have_content @username
      expect(page).to have_selector "#language_info"
      expect(page).to have_selector "#language_most_common"
    end

    it "should let the user try another account" do
      expect(page).to have_link "Try another"
    end
  end

  context "with a valid user account" do
    before(:each) do
      @username = 'neilbilly'
      visit '/'
      fill_in 'query', :with => @username
      click_button 'Search'
    end

    it_behaves_like "a show page"
  end

  context "with a invalid user account" do
    before(:each) do
      @username = 'no_way_is_this_a_real_user_zxcv45r'
      visit '/'
      fill_in 'query', :with => @username
      click_button 'Search'
    end

    it "should explain to the user that it can't find the account" do
      expect(page).to have_selector "#flash_notice"
    end
  end

  context "with a valid url" do
    before(:each) do
      @username = 'neilbilly'
      visit github_account_path(@username)
    end

    it_behaves_like "a show page"
  end
end
