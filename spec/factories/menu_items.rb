require 'faker'

FactoryGirl.define do
  factory :menu_item do |m|
    m.association :venue, factory: :venue
    m.venue_id        { 1 }
    m.calories        { Faker::Number.number(3) }
    m.course          { 'Entree' }
    m.description     { Faker::Lorem.sentence(3, true) }
    m.carbohydrates   { Faker::Number.number(1) }
    m.bal             { Faker::Number.number(1) }
    m.price_cents     { Faker::Number.number(3) }
    m.name            { Faker::Lorem.name }
    m.protein         { Faker::Number.number(2) }
    m.fat             { Faker::Number.number(2) }
    m.vegetarian      { 'no' }
    m.paleo           { 'no' }
    m.vegan           { 'no' }
    m.gluten_free     { 'no' }
    m.low_cal         { 'no' }
    m.low_carb        { 'no' }
    m.low_fat         { 'no' }
    m.hi_protein      { 'no' }
  end
end
