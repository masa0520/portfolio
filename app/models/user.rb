class User < ApplicationRecord
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
end