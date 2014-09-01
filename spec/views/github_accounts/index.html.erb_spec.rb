require 'rails_helper'
RSpec.describe 'github_accounts/index' do

	before do
		render
	end

	it 'should have a form posting to /github_accounts' do
		expect(response).to have_selector("form[action='/github_accounts']")
	end

	%w(query).each do |attr|
		it "should have a field for #{attr}" do
		  expect(response).to have_selector("input[name*=#{attr}]")
		end
	end

end
