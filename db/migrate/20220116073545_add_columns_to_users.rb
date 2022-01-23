class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profileimage_id, :string
    add_column :users, :introduction, :text
  end
end
