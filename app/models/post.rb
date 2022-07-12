class Post < ApplicationRecord

  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  def self.looks(keyword)
    Post.where('title like ?',"%#{keyword}%")
  end

  def self.search(genre)
    Post.where(['genre like ?'], "%#{genre}%")
  end

  scope :latest, -> {order(created_at: :desc)} #created_at=投稿日のカラム#desc＝大きい方から小さい方に並ぶ(降順)
  scope :old, -> {order(created_at: :asc)} #asc＝小さい方から大きい方に並ぶ(昇順)
  scope :favorite_count, -> {order(favorite: :desc)} #

end
