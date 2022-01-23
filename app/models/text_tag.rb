class TextTag < ApplicationRecord

  belongs_to :text
  belongs_to :tag
  validates :text_id, presence: true
  validates :tag_id, presence: true

end
