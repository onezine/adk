class CreateBedroomTypes < ActiveRecord::Migration
  def change
    create_table :bedroom_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
