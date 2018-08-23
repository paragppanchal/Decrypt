# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "creating users"
User.destroy_all

user = User.new(email: 'loviyakane@poly-swarm.com', password: 'password')
user.save!

user_two = User.new(email: 'emaill@gmail.com', password: 'password')
user_two.save!

user_three = User.new(email: 'emailll@gmail.com', password: 'password')
user_three.save!

puts "done"
