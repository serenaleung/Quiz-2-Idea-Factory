FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    # sequence method in FactoryGirl will generate a unique number that
    # increments every time you invoke FactoryGirl on this model. It's a good
    # mehtod to use to ensure that a given generated string will be unique
    sequence(:email) {|n| Faker::Internet.email.gsub('@', "#{n}@") }
    password   'supersecret'
  end
end
