class PlayerAchievement < ActiveRecord::Base
  belongs_to :player
  belongs_to :achievement
end
