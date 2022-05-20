# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(name: "Samson", email: "1@gmail.com", password: "21asdasd1231asdasd0asdasdj")
# Fundraiser.create(title: "The End", description: "Welcome to the end of the world.")
# Event.create(title: "New Event", content: "Lets party!", rsvp: "https://yahoo.com", share: "https://facebook.com")

roles = {"President": 1, "Co-President": 1, "Vice-President": 2, "Secretary": 3, "Social Chair": 3, 
    "Treasurer": 3, "Social Media Chair": 3, "Public Relations Chair": 3, "Cultural Chair": 3,
    "Co-Social Chair": 3, "Co-Cultural Chair": 3}

roles.each do |role, rank|
    Role.create!(title: role, rank: rank)
end