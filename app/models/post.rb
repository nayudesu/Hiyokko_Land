class Post < ApplicationRecord

  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def favorited_by?(member)
    print('==========================')
    print(favorites.inspect)
    favorites.exists?(member_id: member.id)
  end

end
