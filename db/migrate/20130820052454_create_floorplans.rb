class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|

      t.timestamps
    end
  end
end
