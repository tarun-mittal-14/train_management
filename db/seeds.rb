# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

User.create!(email: 'admin@example.com', password: 'password', role: 'admin')
User.create!(email: 'user@example.com', password: 'password', role: 'passenger')

Train.create!(name: 'Train 1', source: 'City A', destination: 'City B', route: 'Route 1', seats: 100)
Train.create!(name: 'Train 2', source: 'City C', destination: 'City D', route: 'Route 2', seats: 150)
Train.create!(name: 'Train 3', source: 'City E', destination: 'City F', route: 'Route 3', seats: 200)
