class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :patients
  has_many :appointments

  validates_presence_of :first_name, :last_name, :maternal_surname, :telephone,:city,:street,:number,:country,:suburb,:cp
  validates :telephone, length: { is: 10 }
  validates :telephone, numericality: { only_integer: true }
  validates :number, numericality: { only_integer: true }
  validates :cp, numericality: { only_integer: true }
  validates :cp, length: { is: 5 }

  def full_name
  		return  first_name + " "+ last_name + " " +maternal_surname
  end


end
