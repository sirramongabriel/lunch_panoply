# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content "MyText"
    title "MyString"
    commentable_type "MyString"
  end
end
