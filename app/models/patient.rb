class Patient < ApplicationRecord
  belongs_to :user,optional: true
  validates_presence_of :first_name,:last_name,:age,:date_birth,:maternal_surname,:gender,:civil_status, :scholarship, :occupation, :street, :suburb, :city , :mun, :county , :telephone

  validates :telephone, length: { is: 10 }
  validates :telephone, numericality: { only_integer: true }

  def self.search(search)
    where("first_name ILIKE ? OR id::varchar ILIKE ? OR last_name ILIKE ? or maternal_surname ILIKE ? ",
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end

    def full_name
      return first_name + " " + last_name + " " +maternal_surname
    end
end
