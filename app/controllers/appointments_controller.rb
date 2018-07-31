class AppointmentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @appointments = Appointment.all
  end
  def new
    @appointment = Appointment.new
  end


  def show
  end

  def data
   appointments = Appointment.all
   render :json => appointments.map {|apmt| {
              :id => apmt.id,
              :start_date => apmt.start_date.to_formatted_s(:db),
              :end_date => apmt.end_date.to_formatted_s(:db),
              :name => apmt.name
          }
        }
 end

 def db_action
   mode = params["!nativeeditor_status"]
   id = params["id"]
   start_date = params["start_date"]
   end_date = params["end_date"]
   name = params["name"]

   case mode
     when "inserted"
       apmt = Appointment.create :start_date => start_date, :end_date => end_date, :name => name,  :patient_id => 1

       tid = apmt.id

     when "deleted"
       Appointment.find(id).destroy
       tid = id

     when "updated"
       apmt = Appointment.find(id)
       apmt.start_date = start_date
       apmt.end_date = end_date
       apmt.name = name
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



end
