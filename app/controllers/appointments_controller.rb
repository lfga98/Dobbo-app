class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show,:edit,:update]
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
  def data
   appointments = Appointment.all
   render :json => appointments.map {|apmt| {
              :id => apmt.id,
              :start_date => apmt.start_date.to_formatted_s(:db),
              :end_date => apmt.end_date.to_formatted_s(:db),
              :text => apmt.patient.full_name
          }
        }
 end

 def db_action
   mode = params["!nativeeditor_status"]
   id = params["id"]
   start_date = params["start_date"]
   end_date = params["end_date"]
   text = params["observation"]

   case mode
     when "inserted"
       apmt = Appointment.create :start_date => start_date, :end_date => end_date, :text => observation,  :patient_id => 1

       tid = apmt.id

     when "deleted"
       Appointment.find(id).destroy
       tid = id

     when "updated"
       apmt = Appointment.find(id)
       apmt.start_date = start_date
       apmt.end_date = end_date
       apmt.text = observation
       apmt.patient_id = 1
       apmt.save
       tid = id
   end

   render :json => {
              :type => mode,
              :sid => id,
              :tid => tid,
          }
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
