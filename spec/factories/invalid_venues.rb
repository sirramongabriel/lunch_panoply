require 'faker'

FactoryGirl.define do
	factory :invalid_venue do |i|
		i.name nil
	end
end
