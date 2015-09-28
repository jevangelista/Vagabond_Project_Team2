# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do 
	email = FFaker::Internet.email
	first_name = FFaker::Name.first_name
	last_name = FFaker::Name.last_name
	current_city = FFaker::AddressUS.city
	user_data = {email: email, password_digest: "qwe", first_name: first_name, last_name: last_name, current_city: current_city}
	user = User.create(user_data)
	5.times do
		title = FFaker::Movie.title
		content = FFaker::BaconIpsum.paragraph
		city = current_city
		user_id = user.id 
		post_data = {title: title, content: content, city: city, user_id: user_id}
		Post.create(post_data)
	end
end