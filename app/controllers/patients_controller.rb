class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit,:update,:show]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient= Patient.new(patient_params)
    @patient.user_id = current_user.id
    if @patient.save
      redirect_to @patient, notice: "El paciente fue añadido!"
    else
      render :new
    end
  end

  def show
  end


  def edit

  end

  def update

    @patient.update(patient_params)

  end

  private

  def patient_params
    params.require(:patient).permit(:first_name,:last_name,:maternal_surname,:age,:date_birth)
  end

  def set_patient
    @patient=Patient.find(params[:id])
  end


end
