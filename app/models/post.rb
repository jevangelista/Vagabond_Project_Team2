class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :city, :foreign_key => :city_name
end
