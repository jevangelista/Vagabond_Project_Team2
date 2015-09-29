class User < ActiveRecord::Base

	has_many :posts
	belongs_to :city, :foreign_key => :city_name
	has_secure_password

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])

	end


end
