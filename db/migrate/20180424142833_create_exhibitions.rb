class CreateExhibitions < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibitions do |t|
      t.references :artist, foreign_key: true
      t.string :title
      t.text :summary
      t.string :place
      t.string :term
      t.string :entrance_fee
      t.string :closed_day
      t.string :opneing_hour
      t.string :information
      t.string :url

      t.timestamps
    end
  end
end
