class Patient < ApplicationRecord
  belongs_to :user,optional: true
  validates_presence_of :first_name,:last_name,:age,:date_birth,:maternal_surname,:gender,:civil_status, :scholarship, :occupation, :street, :suburb, :city , :mun, :county , :telephone

  validates :telephone, length: { is: 10 }
  validates :telephone, numericality: { only_integer: true }

    def full_name
      return first_name + " " + last_name + " " +maternal_surname
    end
end
