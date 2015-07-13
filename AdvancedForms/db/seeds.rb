
# Destroy the old stuff
Team.destroy_all
Member.destroy_all
TeamMember.destroy_all

# Create Teams
20.times do
	t = Team.new

	t.name = Faker::Team.name
	t.description = Faker::Lorem.sentences(1)[0]

	t.save!
end

# Create members
20.times do
	m = Member.new

	m.first_name = Faker::Name.first_name
	m.last_name = Faker::Name.last_name
	m.email = Faker::Internet.email

	m.save!
end

# Create team member associations

Team.all.each do |team|
	members = Member.all.to_a.shuffle
	rand(10).times do |i|
		member = members.pop
		team.members << member
	end
end