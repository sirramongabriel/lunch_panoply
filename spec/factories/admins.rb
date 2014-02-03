require 'faker'

FactoryGirl.define do
  factory :admin do |a|
    a.email { Faker::Internet.email }
    a.password 'password'
    a.password_confirmation 'password'
  end
end
