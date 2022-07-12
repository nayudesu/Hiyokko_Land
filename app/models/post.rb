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

end
