require 'faker'

FactoryGirl.define do
  factory :employee do |e|
  	# e.association :company, factory: :company
  	e.first_name { Faker::Name.first_name }
    e.last_name  { Faker::Name.last_name }
    e.email 		 { Faker::Internet.email }
    e.password   '12345678'
  end
end
