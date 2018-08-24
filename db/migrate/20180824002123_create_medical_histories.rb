class CreateMedicalHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_histories do |t|
      t.boolean :diarrhea
      t.boolean :constipation
      t.boolean :gastritis

      t.timestamps
    end
  end
end
