class Achievement < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, length: {minimum: 3}
end
