class CreateTextTags < ActiveRecord::Migration[5.2]
  def change
    create_table :text_tags do |t|
      t.references :text, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    # 同じタグを２回保存することができなくなる
    add_index :text_tags, [:text_id, :tag_id], unique: true
  end
end
