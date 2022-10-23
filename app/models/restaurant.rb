class Restaurant < ApplicationRecord
  has_many :posts
  has_one :business_hour
end
