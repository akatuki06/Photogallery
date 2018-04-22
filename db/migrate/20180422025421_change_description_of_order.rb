class ChangeDescriptionOfOrder < ActiveRecord::Migration[5.0]
  def up
  	change_column :orders, :user_id, :integer, :default => "0"
  	change_column :orders, :state, :string, :default => "未完了"
  	change_column :orders, :total, :integer, :default => "0"
  	change_column :orders, :postage, :integer, :default => "500"
  	change_column :orders, :payment_state, :string, :default => "未完了"
  	change_column :orders, :shipment_state, :string, :default => "未完了"
  end

  def down
  	change_column :orders, :user_id, :integer, :default => nil
  	change_column :orders, :state, :string, :default => nil
  	change_column :orders, :total, :integer, :default => nil
  	change_column :orders, :postage, :integer, :default => nil
  	change_column :orders, :payment_state, :string, :default => nil
  	change_column :orders, :shipment_state, :string, :default => nil
  end
end
