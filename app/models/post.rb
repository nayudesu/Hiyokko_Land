class Post < ApplicationRecord

  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, length:{ maximum: 70 }
  validates :body, presence: true, length:{ maximum: 800 }

  def get_image(width, height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.jpeg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

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
