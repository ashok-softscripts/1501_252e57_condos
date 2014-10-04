# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery_image do
    name "MyString"
    alt_name "MyString"
    sequence 1
    gallery_id 1
  end
end
