class Text < ApplicationRecord

  attachment :image#（_idは含めません）

  has_many :bookmarks, dependent: :destroy

  has_many :comments, dependent: :destroy

  #belongs_to :tags
  has_many :text_tags,dependent: :destroy
  has_many :tags,through: :text_tags

  belongs_to :user

  validates :title, presence: true, length: {maximum: 64}
  validates :text, presence: true, length: {maximum: 255}


  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_text_tag = Tag.find_or_create_by(name: new)
      self.tags << new_text_tag
    end
  end


  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
