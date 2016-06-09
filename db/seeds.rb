# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Talent.destroy_all
talents = ["Cooking", "English Lessons", "Paining", "Math Lessons", "Coding Lessons"]
emails = ['test1@test.com','test2@test.com','test3@test.com','test4@test.com','test5@test.com']
5.times do |i|
	User.create(
		name: Faker::Name.name, 
		email: emails[i], 
		password: "12345678")
	Talent.create(name: talents.sample, description: Faker::Lorem.sentence,  user_id: User.last.id)
end


