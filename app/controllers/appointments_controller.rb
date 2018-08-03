class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show,:edit,:update,:destroy]
  protect_from_forgery with: :null_session

  def index
    @appointments= current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
      @appointment= Appointment.new(appointment_params)
      @appointment.user_id=current_user.id
      if @appointment.save
        redirect_to @appointment, notice: "La cita fue añadida satisfactoriamente!"
      else
        render :new
      end
  end


  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "La cita fue eliminada satisfactoriamente"
  end


  def show
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment,notice: 'La cita fue modificado satisfactoriamente'
    else
      render :edit
    end
  end

 private

   def appointment_params
     params.require(:appointment).permit(:start_date,:end_date,:observation,:patient_id)
   end

   def set_appointment
     @appointment=Appointment.find(params[:id])
     if current_user.patients.ids.include?(@appointment.patient_id)
     else
       redirect_to patients_path, notice: "No tiene permiso para realizar esta acción"
     end

   end
end
