require 'rails_helper'

describe 'users' do
	context 'no user account' do
		it 'can sign up.' do
			visit '/users/sign_in'
			expect(page).to have_content 'Sign up'
		end

		it 'can create an account' do 
			visit '/users/sign_up'
			fill_in 'Email', with: 'test@test.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome'
		end
	end
end