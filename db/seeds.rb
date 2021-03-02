# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Session.destroy_all
Activity.destroy_all
User.destroy_all
Category.destroy_all

#users
10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "123456",
              trainer: [true, false].sample,
              bio: "Hello I am a trainer",
              zoom_link: "zoom.us"
              )
end


#categories
category_array = ["Strength Training", "Gymnastics", "Endurance", "Body Hit", "Spin", "Shadow Boxing", "Yoga", "Pilates", "Bands", "Core Workout"]

5.times do
  category = Category.create!(name: category_array.sample)
end


#activities
5.times do
  activity = Activity.new(name: Faker::FunnyName.two_word_name,
              user_id: User.where(trainer: true).pluck(:id).sample,
              description: "Super fun class",
              category_id: Category.pluck(:id).sample)
  activity.save!
end


#sessions
10.times do
  Session.create!(min_participants: rand(1..5), max_participants: rand(8..10), start_time: DateTime.now,
  end_time: Date.new(2021, 5, 12),
    price: rand(5..20), activity_id: Activity.pluck(:id).sample, confirmed: false)
end


#bookings
30.times do
  Booking.create!(user_id: User.pluck(:id).sample,
  session_id: Session.pluck(:id).sample,
  attended: true )
end





