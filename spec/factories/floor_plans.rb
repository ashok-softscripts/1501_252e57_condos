# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :floor_plan do
    residence "MyString"
    price 1.5
    bedrooms 1
    bathrooms 1.5
    additions "MyString"
    sq_ft 1.5
    sq_m 1.5
    common_charges 1.5
    monthly_total 1.5
    pilot "MyString"
    avalible_general false
    avaliable_admins false
  end
end
