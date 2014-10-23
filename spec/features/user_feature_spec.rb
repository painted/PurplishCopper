require 'rails_helper'

describe 'users' do
	context 'no user account' do
		it 'can sign up.' do
			visit '/users/sign_in'
			expect(page).to have_content 'Sign up'
		end
	end
end