class Restaurant < ApplicationRecord
  has_many :posts
  has_one :business_hour
  has_many :favorites, dependent: :destroy
end
