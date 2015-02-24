# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# 5.times do |i|
#   Item.create(name:Faker::Hacker.adjective, datetime:Faker::Date.birthday, contact_email:Faker::Internet.email)
# end


# testing items for user
indi = User.where(id:3)[0]
person = User.where(id:4)[0]


indi.items.create(
	name: "Holy Grial",
	state: "lost",
	datetime:Faker::Date.birthday, 
	contact_email:Faker::Internet.email,
	latitude: Faker::Address.latitude,
	longitude: Faker::Address.longitude,
	reward: Faker::Number.number(2),
	category: "misc"
)

indi.items.create(
	name: "crystal skull",
	state: "found",
	datetime:Faker::Date.birthday, 
	contact_email:Faker::Internet.email,
	latitude: Faker::Address.latitude,
	longitude: Faker::Address.longitude,
	category: "misc"
)



### to see all lost items
person.items.create(
	name: "fang gold tooth",
	state: "lost",
	datetime:Faker::Date.birthday, 
	contact_email:Faker::Internet.email,
	latitude: Faker::Address.latitude,
	longitude: Faker::Address.longitude,
	category: "misc"
)

person.items.create(
	name: "another gold tooth",
	state: "lost",
	datetime:Faker::Date.birthday, 
	contact_email:Faker::Internet.email,
	latitude: Faker::Address.latitude,
	longitude: Faker::Address.longitude,
	category: "misc"
)

person.items.create(
	name: "wooden leg",
	state: "lost",
	datetime:Faker::Date.birthday, 
	contact_email:Faker::Internet.email,
	latitude: Faker::Address.latitude,
	longitude: Faker::Address.longitude,
	category: "misc"
)


