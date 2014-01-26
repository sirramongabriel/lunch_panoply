require 'faker'

FactoryGirl.define do
  factory :comment do
    title   { Faker::Lorem.sentence(word_count = 5, supplemental = false) }
    content { Faker::Lorem.paragraphs(paragraph_count = 2, supplimental = false) }
  end
end
