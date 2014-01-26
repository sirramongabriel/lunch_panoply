require 'faker'

FactoryGirl.define do
	factory :company do |c|
		c.name 			{ Faker::Company.name }
		c.address 	{ Faker::Address.street_address(include_secondary = false) }
		c.city      { Faker::Address.city }
		c.state 		{ Faker::Address.state_abbr }
		c.zip 			'55555'
		c.phone 		'8885551111'
	end
end
