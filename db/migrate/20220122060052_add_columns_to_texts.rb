class AddColumnsToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :comment_id, :integer
  end
end
