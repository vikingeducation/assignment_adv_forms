class Player < ActiveRecord::Base
  has_many :player_achievements
  has_many :achievements, :through => :player_achievements

  has_many :scores
  accepts_nested_attributes_for :scores,
                                :reject_if => proc { |attributes| attributes['score'].blank? },
                                :allow_destroy => true
end
