require 'rails_helper'

describe 'twitter' do 

	context 'user' do

		before do
			bob = User.create email: 'test@test.com', name: 'bob', password: '12345678', password_confirmation:'12345678'
			login_as bob
			bob.posts.create(title: 'Test title', description: 'Test description')
		end

		it 'can post to twitter', js:true do 
			visit posts_path
			save_and_open_page
			click_link 'Tweet'
			expect(page).to have_content 'Successfully posted to Twitter'
			expect(@post).to be_tweeted
		end
	end 

end