class Hunter < ActiveRecord::Base
  has_many :hunter_units

  has_many :units, :through => :hunter_units

  accepts_nested_attributes_for :units
end
