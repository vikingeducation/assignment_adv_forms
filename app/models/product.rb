class Product < ActiveRecord::Base
  has_many :category_placements
  has_many :categories, :through => :category_placements

  has_many :reviews

  accepts_nested_attributes_for :reviews,
                                :reject_if => :all_blank,
                                :allow_destroy => true;
end
