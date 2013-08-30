class AddClearPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :clear_password, :string
  end
end
