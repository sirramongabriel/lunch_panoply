require 'faker'

FactoryGirl.define do
  factory :menu_items_retriever do |r|
    r.association :menu_item, factory: :menu_item
    r.retriever
  end
end
