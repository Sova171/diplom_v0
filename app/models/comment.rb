class Comment < ApplicationRecord
  belongs_to :achievement
  belongs_to :user

  validates :context, length: {minimum: 3}
end
