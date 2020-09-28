class Document < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	belongs_to :account
	has_many :steps
	acts_as_taggable
end
