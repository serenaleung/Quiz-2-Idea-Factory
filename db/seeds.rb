# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
User.create(first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            password: '123'


)

end
puts "Users Created"

  4.times do
    user = User.all.sample
    Idea.create(
           title: Faker::Name.title,
           body: Faker::Lorem.paragraph(11, false, 3),
           user_id: user.id

    )
  end
  puts "Ideas Created"

  ideas = Idea.all
  ideas.each do |i|
    rand(0..6).times do
      user = User.all.sample
      i.reviews.create({
        body: Faker::Lorem.paragraph(8, false, 5),
        user_id: user.id
        })
    end
  end

  reviews_count = Review.count
