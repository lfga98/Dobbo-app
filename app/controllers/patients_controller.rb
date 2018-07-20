class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient= Patient.new(patient_params)
    @patient.user_id = current_user.id
    @patient.save
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name,:last_name,:maternal_surname,:age,:date_birth)
  end



end
