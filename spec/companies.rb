require 'faker'

FactoryGirl.define do
	factory :company do |c|
		c.name 			{ Faker::Name.name }
		c.address 	{ Faker::Address.street_address(include_secondary = false) }
		c.city      { Faker::Address.city }
		c.state 		{ Faker::Address.state_abbr }
		c.zip 			{ Faker::Address.zip_code }
		c.phone 		{ Faker::PhoneNumber.phone_number.formats }
	end
end
