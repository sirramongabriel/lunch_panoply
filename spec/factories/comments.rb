# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title   		 { Faker::Lorem.sencence(word_count = 4, supplemental = false, random_words_to_add = 6) }
    content 		 { Faker::Lorem.paragraphs(paragraph_count = 2, suppliemental = false) }
    employee_id  1
    menu_item_id 1
  end
end
