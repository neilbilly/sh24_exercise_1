class GithubAccountsController < ApplicationController

  # GET /github_accounts
  def index
    if params[:query] && params[:query] != ""
  			@account = GithubAccount.new(params[:query])
			if @account.present?
        if @account.user_info.present?
			    redirect_to :action => "show", :id => params[:query]
        else
          flash.now.notice = "We can't find this GitHub account. Maybe it doesn't exist or maybe Github is currently inaccessible."
        end
			end
    end
  end

  # GET /github_accounts/1
  def show
      @account = GithubAccount.new(params[:id])

      if @account.user_info == nil
        flash.now.notice = "We can't find this GitHub account. Maybe it doesn't exist or maybe Github is currently inaccessible."
      end
  end


end
