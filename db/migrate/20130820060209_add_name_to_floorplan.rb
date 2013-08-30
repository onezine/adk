class AddNameToFloorplan < ActiveRecord::Migration
  def change
    add_column :floorplans, :name, :string
  end
end
