class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit,:update,:show,:destroy]

  def index
    if params[:search]
        @patients = current_user.patients.search(params[:search]).order("id ").page(params[:page]).per(10)
    else
        @patients = current_user.patients.order("id ").page(params[:page]).per(10)
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient= Patient.new(patient_params)
    @patient.user_id = current_user.id

    if @patient.save
      redirect_to @patient, notice: "El paciente fue añadido satisfactoriamente!"
    else
      render :new
    end
  end

  def show
    @patient.age=((Date.today - @patient.date_birth)/365).floor
  end
  def edit
    @patient.age=( Date.today.year - @patient.date_birth.year).floor
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'El paciente fue eliminado satisfactoriamente!'
  end


  def update
    if @patient.update(patient_params)
      redirect_to @patient,notice: 'El paciente fue modificado satisfactoriamente'
    else
      render :edit
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name,:last_name,:maternal_surname,:age,:date_birth, :gender,:civil_status,:scholarship,:occupation,:street,:suburb,:city,:mun,:county,:telephone, :email,
    :reason_desc,:number)
  end

  def set_patient
    @patient=Patient.find(params[:id])
  end


end
