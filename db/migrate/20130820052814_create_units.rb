class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.boolean :is_available, :default => true
      t.integer :floorplan_id
      t.integer :orientation_id
      t.integer :block_id
      t.integer :unit_type_id

      t.timestamps
    end
  end
end
