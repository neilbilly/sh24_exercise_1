require 'open-uri'

class GithubAccount

  def initialize(account)
    begin
      @user_info = Octokit.user account
    rescue
      @user_info
    end
  end

  def user_info
    @user_info
  end

  def fetch_user_repos
    if user_info.present?
      if self.user_info.repos_url.present?
        JSON.load(open(self.user_info.repos_url))
      end
    end
  end

  def repo_languages
    languages = []
    user_repos = self.fetch_user_repos
      if user_repos.present?
      user_repos.each do |r|
        languages << r["language"]
      end
    end

    languages
  end

  def repo_language_counts
    languages = self.repo_languages.each_with_object(Hash.new(0)) { |count, language| language[count] += 1 }
    languages.sort_by {|language,count| count}.reverse
  end

  protected :fetch_user_repos, :repo_languages
end
