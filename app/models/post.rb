class Post < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :city

	#TODO: remove `city` attribute

end
