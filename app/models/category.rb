class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :posts
  # 投稿はカテゴリー削除後も保持。category_id は NULL のまま残す方針。
end
