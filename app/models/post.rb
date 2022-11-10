class Post < ApplicationRecord
  #belongs_to :user
  #belongs_to :restaurant
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
