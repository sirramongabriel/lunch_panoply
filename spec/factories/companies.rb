FactoryGirl.define do
	factory :company do
		name 			{ Faker::Name.name }
		address 	{ Faker::Address.street_address(include_secondary = fakse) }
		city      { Faker::Address.city }
		state 		{ Faker::Address.state_abbr }
		zip 			{ Faker::Address.zip_code }
		phone 		{ Faker::PhoneNumber.phone_number }
	end
end
