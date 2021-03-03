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
# User.destroy_all
Category.destroy_all

#users
10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "123456",
              trainer: [true, false].sample,
              bio: "Hello I am a trainer, and this is stuff about moi",
              zoom_link: "zoom.us"
              )
end


#categories
category_array = ["Strength Training", "Gymnastics", "Endurance", "Body Hit", "Spin", "Shadow Boxing", "Yoga", "Pilates", "Bands", "Core Workout"]

5.times do
  category = Category.create!(name: category_array.sample)
end


activity_name_array = ["Get In Shape", "Yoga Basics", "Triple Tone", "Full Body Circuit", "Yoga Intense", "Full-Body Starter", "Pure Pilates", "Intense Shadow Boxing"]

#activities
20.times do
  activity = Activity.new(name: activity_name_array.sample,
              user_id: User.where(trainer: true).pluck(:id).sample,
              description: "Super fun class",
              category_id: Category.pluck(:id).sample)
  activity.save!
end



#sessions
10.times do
  starttime = (((DateTime.now - 10.days)..(DateTime.now + 10.days)).to_a.sample + rand(24).hours).change(min:0)
  Session.create!(min_participants: rand(1..5), max_participants: rand(8..10), start_time: starttime,
  end_time: starttime + 1.hour,
    price: rand(5..20), activity_id: Activity.pluck(:id).sample, confirmed: false)
end









#bookings
30.times do
  Booking.create!(user_id: User.pluck(:id).sample,
  session_id: Session.pluck(:id).sample,
  attended: true )
end





