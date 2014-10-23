require 'rails_helper'

describe 'posts' do
	context 'post listing' do 
		context 'user signed up and logged in.' do

			before do
				user = User.create(email: 'test@test.com', password: '12345678', password_confirmation:'12345678')
				login_as user
			end

			it 'has no posts initially.' do
				user = User.create(email: 'test@test.com', password: '12345678', password_confirmation:'12345678')
				visit "users/1/posts"
				expect(page).to have_content 'no posts yet.'
			end
		end
	end
end	