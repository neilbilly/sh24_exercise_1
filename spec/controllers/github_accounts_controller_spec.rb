require 'rails_helper'

RSpec.describe GithubAccountsController, :type => :controller do

  describe "GET index" do
    context "with a vaild query" do
      before(:each) do
        @username = 'neilbilly'
      end

      it "should assign a new GithubAccount object to the account variable" do
        get :index, :query => @username
        expect(assigns(:account)).to be_kind_of(GithubAccount)
      end

      it "should redirect to the show action" do
        get :index, :query => @username
        expect(response).to redirect_to(:action => :show, :id => @username)
      end
    end

    context "with an invaild query" do
      before(:each) do
        @username = 'no_way_is_this_a_real_user_zxcv45r'
      end

      it "should assign a new GithubAccount object to the account variable" do
        get :index, :query => @username
        expect(assigns(:account)).to be_kind_of(GithubAccount)
      end

      notice = "We can't find this GitHub account. Maybe it doesn't exist or maybe Github is currently inaccessible."
			it "should set a '#{notice}' flash notice message" do
        get :index, :query => @username
        expect(flash[:notice]).to eq notice
      end
    end
	end

  describe "GET show" do
    context "with a vaild account" do
  		it "should assign an GithubAccount object to @account" do
  			get :show, :id => 'neilbilly'
  			expect(assigns(:account)).to be_kind_of(GithubAccount)
  		end
    end

    context "with a invaild account" do
      before(:each) do
        @username = 'no_way_is_this_a_real_user_zxcv45r'
      end

      it "should assign an GithubAccount object to @account" do
        get :show, :id => @username
        expect(assigns(:account)).to be_kind_of(GithubAccount)
      end

      notice = "We can't find this GitHub account. Maybe it doesn't exist or maybe Github is currently inaccessible."
      it "should set a '#{notice}' flash notice message" do
        get :show, :id => @username
        expect(flash[:notice]).to eq notice
      end
    end
	end
end
