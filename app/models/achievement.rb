class Achievement < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_rich_text :description
  validates :title, length: {minimum: 3}
end
