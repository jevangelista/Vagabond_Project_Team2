# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear Database
User.destroy_all
Post.destroy_all

# San Francisco twice to increase chanses of it being picked
cities = ["San Francisco", "New York", "Los Angeles", "London", "Gibraltar", "Las Vegas"]

# Populates the cities table
cities.each do |city|
	City.create({name: city})
end

# Creates 20 users
20.times do 
	email = FFaker::Internet.email
	first_name = FFaker::Name.first_name
	last_name = FFaker::Name.last_name
	city_name = cities[rand(cities.length)] #FFaker::AddressUS.city
	# Each seeded user has password "qwe"
	user_data = {email: email, password: "qwe", first_name: first_name, last_name: last_name, city_name: city_name}
	user = User.create(user_data)
# Creates 5 - 15 posts for each user
	(rand(11) + 5).times do
		title = FFaker::Movie.title
		content = FFaker::BaconIpsum.paragraph
		# 20% chance post is the same as their city
		city = rand(10) < 8 ? city_name : "San Francisco" 
		user_id = user.id 
		post_data = {title: title, content: content, city_name: city, user_id: user_id}
		Post.create(post_data)
	end
end
