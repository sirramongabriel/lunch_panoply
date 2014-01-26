require 'faker'

FactoryGirl.define do
  factory :comment do |c|
  	c.association :employee, factory: :employee
  	c.association :menu_item, factory: :menu_item
    c.title   		 { Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6) }
    c.content 		 { Faker::Lorem.paragraphs(paragraph_count = 2, suppliemental = false) }
    c.employee_id  1
    c.menu_item_id 1
  end
end
