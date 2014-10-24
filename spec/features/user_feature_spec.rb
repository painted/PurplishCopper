require 'rails_helper'

describe 'users.' do
	context 'no user account.' do
		it 'can sign up.' do
			visit '/users/sign_up'
			expect(page).to have_content 'Sign up'
		end

		it 'can create an account.' do 
			visit '/users/sign_up'
			fill_in 'Email', with: 'test@test.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome'
		end

		it 'can create an account entering user name.' do
			visit '/users/sign_up'
			fill_in 'Email', with: 'test@test.com'
			fill_in 'Name', with: 'test name'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Signed in as test name.'
		end
	end
end