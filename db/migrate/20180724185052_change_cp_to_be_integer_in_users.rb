class ChangeCpToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :cp, :integer
  end
end
