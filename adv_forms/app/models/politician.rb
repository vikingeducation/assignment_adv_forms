class Politician < ActiveRecord::Base
  has_many :politician_slogans
  has_many :slogans, through: :politician_slogans

  accepts_nested_attributes_for :slogans,
                                :reject_if => :all_blank,
                                :allow_destroy => true;
end
