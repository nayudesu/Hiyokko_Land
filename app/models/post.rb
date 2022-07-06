class Post < ApplicationRecord

  belongs_to :member
  belongs_to :genre

  has_one_attached :image
end
