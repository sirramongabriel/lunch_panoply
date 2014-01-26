require 'faker'

FactoryGirl.define do
  factory :favorite do
  	association :employee, factory: :employee
  	association :menu_item, factory: :menu_item
    employee_id 1
    menu_item_id 1
  end
end
