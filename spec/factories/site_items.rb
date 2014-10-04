# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_item do
    private_site_id 1
    si_update "MyString"
  end
end
