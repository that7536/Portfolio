class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :title
      t.text :text
      t.string :image_id
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
