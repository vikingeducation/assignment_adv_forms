# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

23.times do
  Actor.new({name: Faker::Name.name}).save
end

23.times do
  Movie.new({title: Faker::App.name}).save
end

Movie.all.each do |movie|
  salt = rand(10)+1
  (rand(10)+1).times do |x|
    Role.new({actor_id: Actor.find(((x+1)*salt)%23).id, movie_id: movie.id}).save
    Quote.new({text: Faker::Hacker.say_something_smart, movie_id: movie.id}).save
  end
end
