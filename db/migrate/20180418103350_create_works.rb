class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.references :artist, foreign_key: true, null: false
      t.string :title
      t.string :image_id
      t.integer :price, null: false
      t.string :creation_date
      t.string :edition
      t.integer :stock, null: false
      t.string :size
      t.string :technique
      t.text :comment
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
