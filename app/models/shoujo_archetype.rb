class ShoujoArchetype < ActiveRecord::Base
  belongs_to :archetype
  belongs_to :shoujo
end
