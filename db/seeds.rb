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

u1 = User.create(name:"Annette Duccoli", email:"annete@hotmail.com", password:"1234", password_confirmation:"1234");
u2 = User.create(name:"Jose Osorno", email:"jose@osorno.com", password:"1234", password_confirmation:"1234");

i1 = Item.create(name:"Passport", datetime:Faker::Date.birthday, contact_email:u2.email, state:"Lost")

r1 = Owner.create(item_id: i1.id, user_id: u2.id);
