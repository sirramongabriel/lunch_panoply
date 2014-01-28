require 'faker'

FactoryGirl.define do
	factory :invalid_company do |i|
		i.name nil
	end
end
