require 'faker'

FactoryGirl.define do
	factory :company do
		name 			{ Faker::Company.name }
		address 	{ Faker::Address.street_address(include_secondary = false) }
		city      { Faker::Address.city }
		state 		{ Faker::Address.state_abbr }
		zip 			'55555'
		phone 		'8885551111'
	end
end
