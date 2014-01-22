require 'faker'

FactoryGirl.define do
  factory :menu_item do
    title        { Faker::Commerce.product_name }
    ingredient1  { Faker::Lorem.word }
    ingredient2  { Faker::Lorem.word }
    ingredient3  { Faker::Lorem.word }
    ingredient4  { Faker::Lorem.word }
    ingredient5  { Faker::Lorem.word }
    ingredient6  { Faker::Lorem.word }
    ingredient7  { Faker::Lorem.word }
    ingredient8  { Faker::Lorem.word }
    ingredient9  { Faker::Lorem.word }
    ingredient10 { Faker::Lorem.word }
    ingredient11 { Faker::Lorem.word }
    ingredient12 { Faker::Lorem.word } 
    ingredient13 { Faker::Lorem.word }
    ingredient14 { Faker::Lorem.word }
    ingredient15 { Faker::Lorem.word }
    ingredient16 { Faker::Lorem.word }
    ingredient17 { Faker::Lorem.word }
    ingredient18 { Faker::Lorem.word }
    ingredient19 { Faker::Lorem.word }
    ingredient20 { Faker::Lorem.word }
    calories     { Faker::Number.number(3) }
    price        { Faker::Number.number(2) }
  end
end
