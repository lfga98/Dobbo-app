class AddNumberToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :number, :integer
  end
end
