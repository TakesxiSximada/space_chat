class CreateDebris < ActiveRecord::Migration
  def change
    create_table :debris do |t|
      t.string :word
      t.integer :size
      t.integer :height
      t.float :angle
      t.references :object_type, index: true
      t.boolean :deleted

      t.timestamps
    end
  end
end
