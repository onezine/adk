class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :name
      t.boolean :allow_click, :default => true

      t.timestamps
    end
  end
end
