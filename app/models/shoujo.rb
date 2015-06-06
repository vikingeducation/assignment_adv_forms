class Shoujo < ActiveRecord::Base
  has_many :shoujo_archetypes
  has_many :archetypes, through: :shoujo_archetypes
  has_many :animes

  accepts_nested_attributes_for :animes, allow_destroy: :true, reject_if: :all_blank
end
