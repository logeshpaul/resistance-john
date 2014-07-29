class Message < ActiveRecord::Base
	validates :author_name, presence: true, length: { minimum: 1, maximum: 250 }
  	validates :contents, presence: true
end