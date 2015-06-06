class Archetype < ActiveRecord::Base
  has_many :shoujo_archetypes
  has_many :shoujos, through: :shoujo_archetypes
end
