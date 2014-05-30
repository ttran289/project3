class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :picture

	validates_presence_of :content
		validates_length_of :content, :maximum => 140
end
