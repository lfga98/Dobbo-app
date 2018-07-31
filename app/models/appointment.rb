class Appointment < ApplicationRecord
  belongs_to :patient, optional: true
  validates_presence_of :start_date,:end_date

end
