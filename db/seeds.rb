# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  4.times do
    Idea.create(
                   title: Faker::Name.title,
                   body: Faker::Lorem.paragraph(11, false, 3),
                   name: Faker::Name.first_name
    )
  end
  puts "Comments Created"

  ideas = Idea.all
  ideas.each do |i|
    rand(0..6).times do
      i.reviews.create({
        body: Faker::Lorem.paragraph(8, false, 5)
        })
    end
  end

  reviews_count = Review.count
