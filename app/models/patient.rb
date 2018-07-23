class Patient < ApplicationRecord
  belongs_to :user,optional: true
  validates_presence_of :first_name,:last_name,:age,:date_birth,:maternal_surname

  
    def full_name
      return first_name + " " + last_name + " " +maternal_surname
    end
end
