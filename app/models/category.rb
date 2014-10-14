class Category < ActiveRecord::Base
    has_many :category_placements
    has_many :products, :through => :category_placements
end
