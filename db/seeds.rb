# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "faker"


puts "Creating fake users..."
#
# 50.times do
#   User.create!(
#     email: Faker::Internet.unique.email,
#     password: "password123",
#     )
# end

# alice = User.create!(email: 'alice@bookshelf.com', password: 'password123', password_confirmation: 'password123')
# bob = User.create!(email: 'bob_reads@bookshelf.com', password: 'password123', password_confirmation: 'password123')
# charlie = User.create!(email: 'charlie_scifi@bookshelf.com', password: 'password123', password_confirmation: 'password123')
#
# puts "Created #{User.count} users."
#
# alice.posts.create!(
#   body: "Just finished 'Dune' for the first time. I can't believe I waited this long to read it. The world-building is absolutely unmatched! 🏜️🐛",
#   created_at: 2.days.ago
# )
#
# alice.posts.create!(
#   body: "Does anyone else buy books faster than they can read them? My physical to-be-read pile is starting to look like a structural hazard.",
#   created_at: 5.hours.ago
# )
#
# bob.posts.create!(
#   body: "Currently diving into 'Clean Code' by Uncle Bob. It is completely changing the way I look at my Ruby files. Highly recommend for any junior devs out there! 💻📖",
#   created_at: 1.day.ago
# )
#
# bob.posts.create!(
#   body: "Hot take: Audiobooks 100% count as reading. Don't let the gatekeepers tell you otherwise! 🎧",
#   created_at: 2.hours.ago
# )
#
# charlie.posts.create!(
#   body: "I am halfway through the 'Three-Body Problem' and my brain is completely melted. Has anyone else read this? No spoilers please!",
#   created_at: 3.days.ago
# )
#
# charlie.posts.create!(
#   body: "Just set up my profile on BookShelf! So excited to have a dedicated place to talk about what I'm reading without annoying my friends on other apps. 🎉",
#   created_at: 15.minutes.ago
# )

puts "#{Post.count} Posts Created"