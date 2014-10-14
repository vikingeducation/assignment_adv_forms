class PoliticianSlogan < ActiveRecord::Base
  belongs_to :politician
  belongs_to :slogan
end
