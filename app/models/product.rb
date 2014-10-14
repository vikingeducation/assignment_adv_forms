class Product < ActiveRecord::Base
  has_many :category_placements
  has_many :categories, :through => :category_placements
end
