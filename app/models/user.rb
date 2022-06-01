class User < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
