class RemoveIsAvailableFromUnit < ActiveRecord::Migration
  def up
     remove_column :units, :is_available
  end

  def down
     remove_column :units, :is_available
  end
end
