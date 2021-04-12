class Book < ApplicationRecord
  enum genre: {
    "参考書": 0, #参考書
    "小説": 1, #小説
    "エッセイ": 2, #エッセイ
    "実用書": 3, #実用書
    "漫画": 4, #漫画
    "その他": 5 #その他
  }

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :genre, presence: true
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
