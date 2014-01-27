require 'faker'

FactoryGirl.define do
	factory :invalid_employee, parent: :employee do |i|
		i.first_name nil
	end
end
