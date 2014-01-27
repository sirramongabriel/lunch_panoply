require 'faker'

FactoryGirl.define do 
	factory :invalid_comment, parent: :comment do |i|
		i.content nil
	end
end
