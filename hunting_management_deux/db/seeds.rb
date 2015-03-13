# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hunter.destroy_all
Unit.destroy_all
HunterUnit.destroy_all

SCHWAD = 15

(SCHWAD * 10).times do
  Hunter.create(
    :name => Faker::Name.name,
    :town => Faker::Address.city
    )
end

SCHWAD.times do
  Unit.create(
    :name => Faker::Lorem.word
    )
end

(SCHWAD*20).times do 
  HunterUnit.create(
    :hunter_id => (Hunter.all.sample.id),
    :unit_id => (Unit.all.sample.id)
    )
end