class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :title, presence: true, length: { maximum: 255 }

  #belongs_to :user
  #belongs_to :restaurant
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
