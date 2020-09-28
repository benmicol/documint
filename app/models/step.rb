class Step < ActiveRecord::Base
	validates :content, presence: true
	validates :summary, presence: true
	belongs_to :document 
	mount_uploader :image, ImageUploader
end
