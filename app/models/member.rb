class Member < ActiveRecord::Base

	validates :name, presence: :true, uniqueness: :true
	validates :title, presence: :true
	validates :sort, presence: :true

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
