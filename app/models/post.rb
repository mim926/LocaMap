class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65_535 }
  validates :prefecture_id, presence:true
  validates :local_user_only

  belongs_to :user
  belongs_to :prefecture
  belongs_to :category

  private

  # 地元民限定しか投稿できないように設定
  def local_user_only
    return if user.nil? || prefecture_id.nil?

    if user.prefecture_id != prefecture_id
      errors.add(:base, "地元民のみ投稿可能です")
    end
end
