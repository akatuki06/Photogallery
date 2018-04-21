class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.string :name
      t.string :name_kana
      t.string :zipcode
      t.string :address
      t.string :phone

      t.timestamps
    end
    add_index :addresses, :name
    add_index :addresses, :name_kana
  end
end
