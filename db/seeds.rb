# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

talents = ["Cooking", "English Lessons", "Paining", "Math Lessons", "Coding Lessons"]
5.times do 
	User.create(
		name: Faker::Name.name, 
		email: Faker::Internet.email, 
		password: "12345678",
		address: "#{Faker::Address.street_name}, #{Faker::Address.city}, #{Faker::Address.country}")
	Talent.create(name: talents.sample, description: Faker::Lorem.sentence, city: User.last.address.split(",")[1].split(" ")[0])
end


