class AddAttToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :telephone, :string
    add_column :users, :street, :string
    add_column :users, :number, :int
    add_column :users, :city, :string
    add_column :users, :mun, :string
    add_column :users, :country, :string
  end
end
