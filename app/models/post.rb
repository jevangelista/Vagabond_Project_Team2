class Post < ActiveRecord::Base
	validates :title, length: { in: 1..200 }
    validates :body, presence: true
	belongs_to :user
	belongs_to :city

end
