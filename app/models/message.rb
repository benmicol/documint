class Message < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :account
end
