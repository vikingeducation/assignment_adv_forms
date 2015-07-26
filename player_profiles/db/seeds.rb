# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Clear all
Player.delete_all
Achievement.delete_all
PlayerAchievement.delete_all


# Create 5 achievements
achievement_names = [
                      "Gold Medal",
                      "Silver Medal",
                      "Bronze Medal",
                      "100 Wins",
                      "100 Losses"
                    ]

achievement_names.each do |name|
  a = Achievement.new
  a.title = name
  a.save!
end


# Create 50 players
while Player.all.count < 50
  p = Player.new
  p.name = Faker::Internet.user_name

  # Assign achievements to each player
  p.achievements = Achievement.all.sample(rand(Achievement.all.count))

  p.save unless Player.all.include?(p)
end

