class AddTitleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tittle, :string
    add_column :users, :suburb, :string
    add_column :users, :cp, :numeric
  end
end
