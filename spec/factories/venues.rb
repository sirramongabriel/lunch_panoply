require 'faker'

FactoryGirl.define do
  factory :venue do |v|
    v.name    { Faker::Company.name }
    v.address { Faker::Address.street_address(include_secondary = false) }
    v.city    { Faker::Address.city }
    v.state   { Faker::Address.state_abbr }
    v.zip     '55555'
    v.email   { Faker::Internet.email }
    v.phone   '1115558888'
    v.fax     '5551119999'
  end
end
