class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :url
      t.text :group
      t.text :career
      t.text :message
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
