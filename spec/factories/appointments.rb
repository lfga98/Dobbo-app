FactoryBot.define do
  factory :appointment do
    start_date "14-08-2018 10:00:00"
    end_date  "14-08-2018 15:00:00"
    observation "Juan Luis Delgado Martinez"
    user_id=1
    patient_id=1
  end
end
