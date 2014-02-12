require 'faker'

FactoryGirl.define do
  factory :menu do |m|
    m.association :venue, factory: :venue
  end
end
