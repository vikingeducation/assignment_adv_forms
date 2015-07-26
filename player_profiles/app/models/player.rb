class Player < ActiveRecord::Base
  has_many :player_achievements
  has_many :achievements, :through => :player_achievements
end
