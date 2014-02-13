require 'faker'

FactoryGirl.define do
  factory :menu do |m|
    m.association :venue, factory: :venue
    m.venue_id 1
  end
end
