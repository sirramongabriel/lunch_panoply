require 'faker'

FactoryGirl.define do
  factory :venue do
    name    { Faker::Company.name }
    address { Faker::Address.street_address(include_secondary = false) }
    city    { Faker::Address.city }
    state   { Faker::Address.state_abbr }
    zip     '55555'
    email   { Faker::Internet.email }
    phone   '1115558888'
    fax     '5551119999'
  end
end
