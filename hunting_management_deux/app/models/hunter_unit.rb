class HunterUnit < ActiveRecord::Base
  belongs_to :hunter
  belongs_to :unit
  validates :hunter, uniqueness: { scope: :unit,
    message: "LIKE OMG DONT HATE YOURSELF ITS OKAY"  }
end
