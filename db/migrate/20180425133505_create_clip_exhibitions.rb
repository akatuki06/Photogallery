class CreateClipExhibitions < ActiveRecord::Migration[5.0]
  def change
    create_table :clip_exhibitions do |t|
      t.references :user, foreign_key: true
      t.references :exhibition, foreign_key: true

      t.timestamps
    end
  end
end
