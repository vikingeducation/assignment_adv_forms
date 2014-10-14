class Slogan < ActiveRecord::Base
  has_many :politician_slogans
  has_many :politicians, through: :politician_slogans
end
