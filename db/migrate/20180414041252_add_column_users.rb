class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :introduction, :text
    add_column :users, :image_id, :text
    add_column :users, :is_artist, :boolean, null: false, default: false
    add_column :users, :is_deleted, :boolean, null: false, default: false
  end
end
