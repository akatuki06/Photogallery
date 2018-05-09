class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :state
      t.integer :total
      t.integer :postage
      t.string :payment_state
      t.string :shipment_state
      t.string :name
      t.string :name_kana
      t.string :zipcode
      t.references :prefecture, foreign_key: true
      t.text :address
      t.string :phone
      t.string :email
      t.string :payment
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
    add_index :orders, :name
    add_index :orders, :name_kana
  end
end
