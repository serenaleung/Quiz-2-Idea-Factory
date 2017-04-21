FactoryGirl.define do
  factory :idea do
    association :user, factory: :user
    title { Faker::Name.title }
    body  { Faker::Lorem.paragraph(11, false, 3) }
    # sequence method in FactoryGirl will generate a unique number that
    # increments every time you invoke FactoryGirl on this model. It's a good
    # mehtod to use to ensure that a given generated string will be unique

end
end
