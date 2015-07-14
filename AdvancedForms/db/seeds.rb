
# Destroy the old stuff
Team.destroy_all
Member.destroy_all
TeamMember.destroy_all
Author.destroy_all
Book.destroy_all

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

# Create authors
20.times do
	a = Author.new

	a.first_name = Faker::Name.first_name
	a.last_name = Faker::Name.last_name
	a.email = Faker::Internet.email

	a.save!
end

# Create books
20.times do
	b = Book.new

	authors = Author.pluck(:id)

	b.title = Faker::Lorem.words(4).join(' ').titleize
	b.description = Faker::Lorem.sentences(1)[0]
	b.author_id = authors.sample

	b.save!
end