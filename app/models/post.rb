class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65_535 }
  validates :prefecture_id, presence: true
  validate :local_user_only

  belongs_to :user
  belongs_to :prefecture
  belongs_to :category

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader

  private

  # 地元民限定しか投稿できないように設定
  def local_user_only
    return if user.nil? || prefecture_id.nil?

    if user.prefecture_id != prefecture_id
      errors.add(:base, "地元民のみ投稿可能です")
    end
  end
end
