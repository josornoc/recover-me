# Read about factories at https://github.com/thoughtbot/factory_girl
# Item.create(name:Faker::Hacker.adjective, datetime:Faker::Date.birthday, contact_email:Faker::Internet.email)

require 'faker'

FactoryGirl.define do
  factory :item do
    name          { Faker::Hacker.adjective } # Why using lamdba here?
    datetime      { Faker::Date.birthday }
    contact_email { Faker::Internet.email }
  end
end