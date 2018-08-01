class Appointment < ApplicationRecord
  extend TimeSplitter::Accessors
  split_accessor :start_date
  belongs_to :patient, optional: true
  validates_presence_of :start_date,:end_date

end
