class Comment < ApplicationRecord

  belongs_to :user

  belongs_to :text

  validates :comment, presence: true, length: {maximum: 64}
end
