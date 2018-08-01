class RenameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :name, :observation
  end
end
