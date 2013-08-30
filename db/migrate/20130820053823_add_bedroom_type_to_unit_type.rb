class AddBedroomTypeToUnitType < ActiveRecord::Migration
  def change
    add_column :unit_types, :bedroom_type_id, :integer
  end
end
