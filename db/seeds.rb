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
City.destroy_all

cities = [["San Francisco", "https://images.unsplash.com/photo-1439396087961-98bc12c21176?q=80&fm=jpg&s=bce7579fe32b464cc2d53c5c144a2de4" ], 
["New York", "#"], ["Los Angeles", "#"], ["London", "#"], ["Gibraltar", "#"],["Las Vegas", "#"]]

# Populates the cities table
cities.each do |c|
	city = City.create({name: c[0], imgurl: c[1]})
	p " ID: #{city.id} | #{city.name}"
end

def getCityId(city)
	cityObj = City.find_by name: city
	return cityObj.id
end

# Creates 20 users
20.times do 
	email = FFaker::Internet.email
	p "#{email} | password: qwe"
	first_name = FFaker::Name.first_name
	last_name = FFaker::Name.last_name
	city_name = cities[rand(cities.length)]
	# Each seeded user has password "qwe"
	user_data = {email: email, password: "qwe", first_name: first_name, last_name: last_name, city_id: getCityId(city_name)}
# p "before creating user #{user_data}"
	user = User.create(user_data)
# p "after creating user #{user}"
# Creates 5 - 15 posts for each user
	(rand(11) + 5).times do
		title = FFaker::Movie.title
		content = FFaker::BaconIpsum.paragraph
		# 80% chance post is the same as their city
		city = rand(10) < 8 ? city_name : "San Francisco" 
		user_id = user.id 	
		post_data = {title: title, content: content, user_id: user_id, city_id: getCityId(city)}
		Post.create(post_data)
	end
end
