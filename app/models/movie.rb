class Movie < ActiveRecord::Base
  has_many :quotes
  has_many :roles
  has_many :actors, :through => :roles

  accepts_nested_attributes_for :quotes, :reject_if => :all_blank,
                                         :allow_destroy => true
end
