require 'rails_helper'

describe 'posts' do
	context 'unsigned in user' do
		it 'is redirected to the login page before posting.' do
			visit '/'
			click_link 'Add a post!'
			expect(page).to have_content 'You need to sign in or sign up before continuing.'
		end
	end

	context 'user signed up and logged in.' do 
		context 'post listing and adding' do

			before do
				@user = User.create(email: 'test@test.com', password: '12345678', password_confirmation:'12345678')
				login_as @user
			end

			it 'has no posts initially.' do
				expect(@user.posts.count).to equal 0
			end

			it 'can create a post.' do 
				visit '/posts/new' 
				fill_in 'Title', with: 'Test Title'
				fill_in 'Description', with: 'Test Description'
				click_button 'Submit'
				expect(@user.posts.count).to equal 1
				expect(page).to have_content 'Test Title'
				expect(page).to have_content 'Test Description'
			end

			it 'can create a post with an image attached.' do
				visit '/posts/new' 
				fill_in 'Title', with: 'Test Title'
				fill_in 'Description', with: 'Test Description'
				attach_file 'Image', Rails.root.join('spec/images/test.jpg')
				click_button 'Submit'
				expect(page).to have_css 'img.uploaded-pic'
			end

			it 'does not add an image field if no image is attached.' do
				visit '/posts/new' 
				fill_in 'Title', with: 'Test Title'
				fill_in 'Description', with: 'Test Description'
				click_button 'Submit'
				expect(page).not_to have_css 'img.uploaded-pic'
			end
		end
	end
end	