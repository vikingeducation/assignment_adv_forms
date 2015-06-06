Shoujo.destroy_all # but my waifus
Archetype.destroy_all

20.times do |shoujo_num|
  s = Shoujo.new
  s.name = Faker::Name.name
  s.save!
end

50.times do |archetype_num|
  a = Archetype.new
  a.name = Faker::Lorem.word
  a.save!
end

100.times do
  shoujo_id = rand(Shoujo.all.count)
  archetype_id = rand(Archetype.all.count)
  ShoujoArchetype.create( { shoujo_id: shoujo_id,
                            archetype_id: archetype_id })
end
