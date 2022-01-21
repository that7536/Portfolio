class Text < ApplicationRecord

  attachment :image#（_idは含めません）

  has_many :bookmarks, dependent: :destroy

  has_many :comments, dependent: :destroy

  #belongs_to :tags

  belongs_to :user

  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
