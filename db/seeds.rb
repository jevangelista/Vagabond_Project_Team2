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

cities = [
	["San Francisco", "https://images.unsplash.com/photo-1439396087961-98bc12c21176?q=80&fm=jpg&s=bce7579fe32b464cc2d53c5c144a2de4"],
	["New York", "http://i.huffpost.com/gen/1378052/images/o-NEW-YORK-facebook.jpg"],
	["Los Angeles", "http://www.udr.com/uploadedImages/UDR3/Market_Areas/Common/UDR_3.0_LosAngeles.jpg?n=9378"],
	["London", "http://wsgtmedia.s3.amazonaws.com/wp-content/uploads/2014/11/2014-11-10_5460d14ad632a_London.jpg"],
	["Gibraltar", "https://upload.wikimedia.org/wikipedia/commons/b/b9/Rock_of_Gibraltar_Barbary_Macaque.jpg"],
	["Las Vegas", "http://flippins.com/wp-content/uploads/2014/02/las-vegas-night.jpg"]
]

# Populates the cities table
cities.each do |c|
	city = City.create({name: c[0], imgurl: c[1]})
	p " ID: #{city.id} | #{city.name}"
end

def getCityId(city)
	# p "In getCityId"
	cityObj = City.find_by name: city
	# p "returning #{cityObj.id}"
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
		# p "Beginning of post creation"
		title = FFaker::Movie.title
		content = FFaker::BaconIpsum.paragraph
		# 80% chance post is the same as their city
		city = rand(10) < 8 ? city_name : "San Francisco" 
		user_id = user.id 	
		post_data = {title: title, content: content, city_id: getCityId(city), user_id: user_id}
		# p "post_data: #{post_data}"
		Post.create(post_data)
		# p "This will not be printed"
	end
end
