# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :private_site do
    receiver_email "MyString"
    receiver_name "MyString"
    email_cc "MyString"
    email_bcc "MyString"
    email "MyText"
    welcome_msg "MyText"
    specials "MyString"
    uniq_ident "MyString"
  end
end
