class AddAvailabilityToUnit < ActiveRecord::Migration
  def change
    add_column :units, :availability_id, :integer
  end
end
