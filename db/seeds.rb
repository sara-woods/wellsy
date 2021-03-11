# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"

Session.destroy_all
User.destroy_all
Order.destroy_all
Booking.destroy_all

Activity.destroy_all
Category.destroy_all

Review.destroy_all

bio_array = [
            " BS in Physical Education as well as a MS in Exercise Science and Health Promotion. He is a Certified Strength and Conditioning Specialist (CSCS). He has a background in health and fitness as well as athletic performance training with over 20 years of certification and experience in the field. His passion for fitness began through his love of sports and developed as a varsity athlete in basketball.",
            " Undergraduate student at Georgetown University. She became a National Academy of Sports Medicine (NASM) Certified Personal Trainer in 2019, and is currently working toward a specialization in corrective exercise. A lifelong dancer, Ashley believes wholeheartedly that movement is a necessary component of physical and mental wellness and personal expression.",
            " Certified Strength and Condition Specialist (CSCS) with the National Strength and Conditioning Association. He has an extensive background from training professional and amateur athletes to working professionals with nominal experience in fitness. Christopher approaches fitness as a life long behavior modification where we have continuous improvement. He defines his sessions as simple, challenging, and efficient with an emphasis on proper form and mobility.",
            " ACE Certified Personal Trainer since 2017 and previously worked as a Personal Trainer at the University of Maryland. He is currently pursuing a Master’s of Science in Analytics at GU, and hopes to use that knowledge to spread and improve health and wellness! Doug found his passion for fitness throughout middle and high school. He played sports his entire life, but was overweight and could not balance his nutrition and exercise in a healthy and effective way.",
            " Orthopedic & Sports Medicine Physical Therapy for 27 years and as a Personal Trainer for 15 years. B.A. in Kinesiology and is a National Strength and Conditioning Association (NSCA) Certified Personal Trainer and National Academy of Sports Medicine (NASM) Certified Corrective Exercise Specialist. Her passion for exercise began during her first experience with Tae Bo at a young age",
            " BS in Biology/Pre-Medical Sciences and a MS in Public Health with a concentration in Nutrition. She is an ACE Certified Personal Trainer and Group Fitness Instructor. She also holds a specialty certification as a Fitness Nutrition Specialist, Spinning Instructor, and TRX Instructor. Maegen has an extensive background in strength, conditioning, speed, endurance, and agility training as she was a former collegiate athlete."
            ]



trainer_images = ["https://images.unsplash.com/photo-1597347343908-2937e7dcc560?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/flagged/photo-1566064352554-f36ef0ef23b2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1529516548873-9ce57c8f155e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1518609571773-39b7d303a87b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1544972917-3529b113a469?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/flagged/photo-1566063698649-9df11f39ba51?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1534368420009-621bfab424a8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1594381898411-846e7d193883?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/photo-1548690312-e3b507d8c110?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/photo-1485727749690-d091e8284ef3?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=800&q=80",
"https://images.unsplash.com/photo-1554244933-d876deb6b2ff?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Z3ltJTIwYmxhY2slMjB3b21hbnxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1592704708371-7bf1b1a19d6f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8eW9nYSUyMGJsYWNrJTIwd29tYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"]

trainee_images=["https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1552058544-f2b08422138a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=644&q=80",
"https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1543080853-556086153871?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/photo-1596215143922-eedeaba0d91c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/photo-1595399874399-10f2444c4eb2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=775&q=80",
"https://images.unsplash.com/photo-1535643302794-19c3804b874b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/photo-1589216996730-20b7fdef7216?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80",
"https://images.unsplash.com/photo-1590697442615-a381b5b557c7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
"https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1563178406-4cdc2923acbc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjl8fHlvZ2ElMjBibGFjayUyMHdvbWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1543486958-d783bfbf7f8e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1582152629442-4a864303fb96?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2VsZmllfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1518671645931-e1d946a64b17?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8c2VsZmllfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1551854590-dc9c6265b1b1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8YXNpYW4lMjB3b21hbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
]

puts "Creating trainers...."
#trainers
10.times do
  user = User.new(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "123456",
              trainer: true,
              bio: bio_array.sample,
              zoom_link: "https://us05web.zoom.us/j/85926576978?pwd=TGFQdkk5R3dqVmpVZFZrdlFjYmZhUT09"
              )
              user.photo.attach(io: URI.open(trainer_images.sample), filename: 'nes.png', content_type: 'image/png')
              user.save!
end

puts "Creating trainees..."
#trainees
trainees = []
10.times do
  user = User.new(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "123456",
              trainer: false,
              )
              user.photo.attach(io: URI.open(trainee_images.sample), filename: 'nes.png', content_type: 'image/png')
              user.save!
              trainees << user
end

puts "Patience you must have, my young padawan."


#categories
category_array = ["Endurance", "Yoga", "Strength Training", "Aerobics", "Bands", "Body Hit", "Pilates", "Shadow Boxing", "Core Workout"]


categories = {
  "Endurance": "https://images.unsplash.com/photo-1434596922112-19c563067271?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  "Yoga": "https://images.unsplash.com/photo-1552196563-55cd4e45efb3?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1226&q=80",
  "Strength Training": "https://images.unsplash.com/photo-1533560777802-046814bc297c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
  "Aerobics": "https://images.unsplash.com/photo-1533547252597-ef7bf6c4479f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  "Bands": "https://images.unsplash.com/photo-1517637382994-f02da38c6728?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
  "Body Hit": "https://images.unsplash.com/photo-1544717684-1243da23b545?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  "Pilates": "https://images.unsplash.com/photo-1518611012118-696072aa579a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" ,
  "Shadow Boxing": "https://images.unsplash.com/photo-1593352216894-89108a0d2653?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  "Core Workout": "https://images.unsplash.com/photo-1516208398649-d5d401ba8c49?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80"}


activity_name_array = ["Get In Shape", "Yoga Basics", "Triple Tone", "Full Body Circuit", "Intense Bands", "Full-Body Starter", "Pure Pilates", "Intense Shadow Boxing", "Let's Core"]

description_array = [
                    " Grab your weapons. Whether you wage war with ropes, sandbells or kettlebells, this is a workout for true warriors. We’re talking peak power, epic endurance and hardcore HIIT for aspiring athletes, fitness fanatics and first-timers alike. Get practicing your battle cry. It’s about to go down.",
                    " If you thought the name was inspired by the killer abs you’re going to get from this class, we’ve got bad news. Try the killer workout you crunch, twist and plank through to get there. This is one mad assault on your middle that definitely earns that 6 pack. (And the one in the fridge.)",
                    " For full-body fitness, row is all you need to know. Dive in the deep end with a hardcore workout that tightens up your technique, perfects pacing and helps you unlock your body’s natural biomechanical speed. Sure, we like to get a bit sciencey. But with expert instructors to guide you, you won’t be without a paddle.",
                    " Whether you’re a slave to the rhythm or addicted to bass, this catchy little conditioning class is guaranteed to get peak fitness pouring from every pore. This is bodyweight endurance to a beat, challenging your strength, sculpting your figure and making music pulse through every muscle. The floor is yours.",
                    " Swap your same-old cardio routine for a group session that'll really test your stamina. Working you hard from top to toe, this kettlebell swing circuit builds power and shreds fat while the energy in the studio reaches boiling point. Hold tight because things are about to get seriously steamy.",
                    " Discover what it means to be a true triple threat at Trilactic. Taking over the Escalate studio, you’ll move through three stations as part of a trio – tackling lung-busting, lactic system-enhancing challenges that improve strength, cardio and agility. Well they say good things come in threes…",
                    " We have teamed up with Track Mafia to bring you weekly outdoor running sessions, whether you are a beginner or seasoned vet their aim is to give you the tools you need to smile in the face of discomfort. All abilities welcome.",
                    " When it comes to lifting, we don’t all like it heavy and slow. If it’s plenty of pumping and a cranked up tempo that gets you going, these low-weight loads provide all the sweaty, sculpting, rep-fuelled rough n' tumble you need. It’s impossible to not look in the mirror and feel yourself after this.",
                    " For full-body fitness, row is all you need to know. Dive in the deep end with a hardcore workout that tightens up your technique, perfects pacing and helps you unlock your body’s natural biomechanical speed. Sure, we like to get a bit sciencey. But with expert instructors to guide you, you won’t be without a paddle.",
                    " Build the strength to smash life, without the incredible bulk. This is all about control: precise movements that stretch and tone to improve your posture, increase your flexibility and reinforce your core. You know what they say. Hit the mat and you’ll never go back."
                    ]


puts "Creating categories..."
categories.each do |category, url|
  file = URI.open(url)
  category = Category.new(name: category)
  category.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  category.save
end



puts "Creating activities..."
#activities new
activities = []
2.times  do
  activity_name_array.each_with_index do |activity_name, i|
    activity = Activity.new(name: activity_name,
                user_id: User.where(trainer: true).pluck(:id).sample,
                description: description_array.sample,
                category_id: Category.find_by_name(category_array[i]).id)
    activity.save!
    activities <<  activity
  end
end


puts "Creating sessions..."
#sessions
40.times do
  starttime = (((DateTime.now - 10.days)..(DateTime.now + 20.days)).to_a.sample + rand(24).hours).change(min:0)
  Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: starttime,
  end_time: starttime + 1.hour,
    price_cents: ("#{rand(5..20)}00").to_i, activity_id: Activity.pluck(:id).sample, confirmed: false)
end

# Session for Friday
Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: DateTime.new(2021, 03, 12, 18, 00, 0),
end_time: DateTime.new(2021, 03, 12, 20, 00, 0),
  price_cents: ("#{rand(5..20)}00").to_i, activity_id: Activity.pluck(:id).sample, confirmed: false)

puts "Creating bookings..."
#bookings
60.times do
  user_id = User.where(trainer: false).pluck(:id).sample
  Booking.create!(user_id: user_id,
  session_id: Session.all.reject { |session| session.attendees.pluck(:id).include?(user_id) }.pluck(:id).sample,
  attended: true )
end



fake_reviews = ["It was my first time trying this and I learned a lot from it. Can’t wait to do it again!",
"It’s great for people of all levels, and manages to do a lot in one hour without feeling rushed. It’s my favorite class I’ve ever taken!",
"They both give you enough instruction on what you’ll be doing next, while talking through the workout, specifically at points where they know you’ll slack off a little or need an extra boost.",
"You walk out feeling exhausted but amazing.",
"Very nicely done.",
"Nothing to complain about",
"The most energetic and motivating instructor",
"Definitely will be there again",
"You get a great workout, burn tons of calories and have a great time doing it.",
"It is really amazing to come back from vacations in a better shape than when I left! Trainings are painful (in a good way :)) and never boring! ",
"Very good trainer, motivated and great relationships with clients!",
"Looking forward to coming back!",
"It was ok"]

puts "Creating reviews..."
30.times do
  Review.create(content: fake_reviews.sample,
  rating: rand(3..5),
  user_id: User.where(trainer: false).pluck(:id).sample,
  session_id: Session.pluck(:id).sample)
end







############################# FOR PRESENTATION ################################

# Create trainer

  trainer = User.new(name: "Nicky Connor",
              email: "nicky@gmail.com",
              password: "123456",
              trainer: true,
              bio: bio_array.sample,
              zoom_link: "https://us05web.zoom.us/j/85926576978?pwd=TGFQdkk5R3dqVmpVZFZrdlFjYmZhUT09"
              )
              trainer.photo.attach(io: URI.open("https://images.unsplash.com/photo-1598136490929-292a0a7890c2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjN8fHdvcmtvdXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"), filename: 'nes.png', content_type: 'image/png')
              trainer.save!


activity = Activity.new(name: activity_name_array[2],
            user_id: trainer.id,
            description: description_array.sample,
            category_id: Category.find_by_name(category_array[2]).id)
activity.save!


session1 = Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: DateTime.new(2021, 03, 12, 18, 00, 0),
end_time: DateTime.new(2021, 03, 12, 20, 00, 0),
  price_cents: ("#{rand(5..20)}00").to_i, activity_id: activity.id, confirmed: false)

session2 = Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: DateTime.new(2021, 03, 06, 18, 00, 0),
end_time: DateTime.new(2021, 03, 06, 19, 00, 0),
  price_cents: ("#{rand(5..20)}00").to_i, activity_id: activity.id, confirmed: false)

session3 =  Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: DateTime.new(2021, 03, 21, 18, 00, 0),
end_time: DateTime.new(2021, 03, 21, 19, 00, 0),
  price_cents: ("#{rand(5..20)}00").to_i, activity_id: activity.id, confirmed: false)

session4 =  Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: DateTime.new(2021, 02, 27, 15, 00, 0),
end_time: DateTime.new(2021, 02, 27, 16, 00, 0),
  price_cents: ("#{rand(5..20)}00").to_i, activity_id: activity.id, confirmed: false)

# Create random bookings for session 1
Booking.create!(user_id: trainees[0].id,
session_id: session1.id,
attended: true )

Booking.create!(user_id: trainees[1].id,
session_id: session1.id,
attended: true )

Booking.create!(user_id: trainees[2].id,
session_id: session1.id,
attended: true )

# Createbookings for session 2

Booking.create!(user_id: trainees[3].id,
session_id: session2.id,
attended: true )

Booking.create!(user_id: trainees[4].id,
session_id: session2.id,
attended: true )

Booking.create!(user_id: trainees[5].id,
session_id: session2.id,
attended: true )

# Createbookings for session 3

Booking.create!(user_id: trainees[6].id,
session_id: session3.id,
attended: true )

Booking.create!(user_id: trainees[7].id,
session_id: session3.id,
attended: true )

# Revviews for trainer

Review.create(content: fake_reviews.sample,
rating: rand(3..5),
user_id: trainees[0].id,
session_id: session3.id)

Review.create(content: fake_reviews.sample,
rating: rand(3..5),
user_id: trainees[1].id,
session_id: session3.id)

Review.create(content: fake_reviews.sample,
rating: rand(3..5),
user_id: trainees[2].id,
session_id: session3.id)

######################### TRAINEE ##############################################


# Create trainee

  trainee = User.new(name: "Mathilde Lindgren",
              email: "mathilde@gmail.com",
              password: "123456",
              trainer: false,
              )
              trainee.photo.attach(io: URI.open("https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"), filename: 'nes.png', content_type: 'image/png')
              trainee.save!

Booking.create!(user_id: trainee.id,
session_id: session1.id,
attended: true )

Booking.create!(user_id: trainee.id,
session_id: session2.id,
attended: true )

Booking.create!(user_id: trainee.id,
session_id: session4.id,
attended: false )


Session.create!(min_participants: rand(1..5), max_participants: 20, start_time: DateTime.new(2021, 02, 20, 15, 00, 0),
end_time: DateTime.new(2021, 02, 20, 16, 00, 0),
  price_cents: ("#{5}00").to_i, activity_id: activities[6].id, confirmed: false)

