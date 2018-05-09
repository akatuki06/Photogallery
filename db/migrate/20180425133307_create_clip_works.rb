class CreateClipWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :clip_works do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
