class User < ActiveRecord::Base
	has_secure_password

	belongs_to :city
	has_many :posts
	

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

	#TODO: remove `city` attribute

