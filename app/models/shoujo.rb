class Shoujo < ActiveRecord::Base
  has_many :shoujo_archetypes
  has_many :archetypes, through: :shoujo_archetypes
end
