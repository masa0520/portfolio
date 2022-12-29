class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :nickname, presence: true, length: { maximum: 255 }

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy


#userオブジェクトのidとpostやlikeオブジェクトのuser_idが同じかどうかを判断
def own?(object)
  self.id == object.user_id
end

#likes_postsテーブルにpostオブジェクトを追加する。
#いいねを押したときに、いいねしたユーザーといいねされた投稿の情報が保存される。
def like(post)
  liked_posts << post
end

#likes_postsテーブルから引数のpostオブジェクトに該当するレコードを削除する。
def unlike(post)
  liked_posts.destroy(post)
end

#likes_postsテーブルに引数のpostオブジェクトに該当するレコードがあるかを判断する。
def like?(post)
  liked_posts.include?(post)
end

def liked?(post)
  likes.exists?(post_id: post.id)
end
end