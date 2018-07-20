class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :patients


  validates_presence_of :first_name, :last_name, :maternal_surname, :telephone
  validates :telephone, length: { is: 10 }
  validates :telephone, numericality: { only_integer: true }

  def full_name
  		return "LN. "+ first_name + " "+ last_name + " " +maternal_surname
  end


end
