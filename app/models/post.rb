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

  def self.search(genre_id)
    Post.where(genre_id: genre_id)
  end

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :favorite_count, -> {order(favorite: :desc)}

end
