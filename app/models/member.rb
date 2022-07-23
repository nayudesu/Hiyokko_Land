class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :profile_image

  validates :nickname, presence: true, length: { minimum: 2, maximum: 15 }
  validates :introduction, length: { maximum: 70 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-icon.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.looks(keyword)
    Member.where('nickname like ?',"%#{keyword}%")
  end

  def self.guest
    find_or_create_by!(nickname: 'ゲスト' ,email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.nickname = "ゲスト"
    end
  end

end
