class Patient < ApplicationRecord
  belongs_to :user,optional: true
  validates_presence_of :first_name,:last_name,:age,:date_birth,:maternal_surname
end
