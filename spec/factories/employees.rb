require 'faker'

FactoryGirl.define do
  factory :employee do |e|
  	e.association :company, factory: :company
  	# e.association :comment, factory: :comment
  	# e.association :favorite, factory: :favorite
  	# e.association :menu_item, factory: :menu_item
    e.first_name { Faker::Name.first_name }
    e.last_name  { Faker::Name.last_name }
  end
end
