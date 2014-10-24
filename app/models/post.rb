class Post < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: {thumb: '300X300>'}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
