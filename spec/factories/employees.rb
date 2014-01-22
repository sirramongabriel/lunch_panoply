require 'faker'

FactoryGirl.define do
  factory :employee do |e|
  	# e.association :company, factory: :company
    e.first_name { Faker::Name.first_name }
    e.last_name  { Faker::Name.last_name }
  end
end
