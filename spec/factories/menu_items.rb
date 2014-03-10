require 'faker'

FactoryGirl.define do
  factory :menu_item do 
    association :venue, factory: :venue
    venue_id        { 1 }
    calories        { Faker::Number.number(3) }
    course          { 'Entree' }
    description     { Faker::Lorem.sentence(3, true) }
    carbohydrates   { Faker::Number.number(1) }
    bal             { Faker::Number.number(1) }
    price_cents     { Faker::Number.number(3) }
    name            { Faker::Lorem.name }
    protein         { Faker::Number.number(2) }
    fat             { Faker::Number.number(2) }
    vegetarian      { 'no' }
    paleo           { 'no' }
    vegan           { 'no' }
    gluten_free     { 'no' }
    low_cal         { 'no' }
    low_carb        { 'no' }
    low_fat         { 'no' }
    hi_protein      { 'no' }
  end
end
