# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  @politicians = ["Barack Obama", "George Bush", "Bill Clinton", "Ronald Reagan",
    "Abraham Lincoln", "Vladimir Putin","Boris Yeltsin", "Ron Paul", 
    "Ted Kennedy", "Nancy Pelosi", "Mitt Romney", "Jerry Brown", "Newt Gingrich"]

  @slogans = ["Free things for everyone!", "Vote for me and get world peace!",
    "Drill, baby drill!", "I invented the internet!", "Free soda for life!",
    "Nukes. Moar Nukes.", "The choice to choose!", "Moar Jobs!", "It's morning in America",
    "It's evening somewhere else", "Don't stop thinking about tomorrow", "Who you gonna call"]

  @parties = ["Republican", "Democrat", "Independent"]

  @politicians.each do |i|
    Politician.create(
      name: i,
      party: @parties.sample)
  end


  @slogans.each do |i|
    Slogan.create(
      name:  i
    )
  end

  30.times do |i|
    PoliticianSlogan.create(
      politician_id: (rand(Politician.all.count)),
      slogan_id: (rand(Slogan.all.count))
      )
  end