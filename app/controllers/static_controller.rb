class StaticController < ApplicationController
  def home
  end

  def diary
  end


  def data
   appointments = current_user.appointments
   render :json => appointments.map {|apmt| {
              :id => apmt.id,
              :start_date => apmt.start_date.to_formatted_s(:db),
              :end_date => apmt.end_date.to_formatted_s(:db),
              :text => "Cita de " +apmt.patient.full_name
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

end
