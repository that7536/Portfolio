class Text < ApplicationRecord

  attachment :profileimage#（_idは含めません）

  has_many :bookmarks, dependent: :destroy

  has_many :comments, dependent: :destroy

  #belongs_to :tags

  belongs_to :user



end
