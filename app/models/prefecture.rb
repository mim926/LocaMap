class Prefecture < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :users
  has_many :posts

  def self.ransackable_attributes(auth_object = nil)
    %w[id name]
  end

end
