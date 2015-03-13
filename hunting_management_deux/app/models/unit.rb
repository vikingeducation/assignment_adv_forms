class Unit < ActiveRecord::Base
  has_many :hunter_units

  has_many :hunters, :through => :hunter_units

  accepts_nested_attributes_for :hunters

end
