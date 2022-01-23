class Tag < ApplicationRecord


  has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
  # text_tagsを通じて複数のtextを参照する
  has_many :texts,through: :text_tags

  validates :name, uniqueness: true, presence: true



end
