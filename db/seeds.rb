

user=User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Leonardo", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890",street:"Villa del nogal",number:12,city:"Zacatecas",mun:"Guadalupe",country:"México",tittle:"Licenciado en Nutrición",suburb:"Villas de Guadalupe",cp:98612)

user=User.create(email: "user@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890",street:"Villa del nogal",number:12,city:"Zacatecas",mun:"Guadalupe",country:"México",tittle:"Licenciado en Nutrición",suburb:"Villas de Guadalupe",cp:98612)

mh=MedicalHistory.create(
  diarrhea:"false",
  constipation:"false",
  gastritis:"false")


10.times do |patient|
  Patient.create(
    user_id:user.id,
    first_name:"Leonardo",
    last_name: "Garcia",
    maternal_surname: "Acosta",
    age:16,
    date_birth: Date.today,
    gender: "Hombre",
    civil_status:"Soltero",
    scholarship:"Primaria" ,
    occupation: "Constructor",
    street: "Villa del nogal",
    suburb: "Villas de guadalupe",
    city: "Guadalupe",
    mun: "Guadalupe",
    county: "Zacatecas",
    telephone: "4921783456",
    email: "Leonardo@gmail.com",
    reason_desc:"Adios",
    medical_history_id: mh.id
  )
end
50.times do |aptm|
  Appointment.create(start_date:"05-08-2018 14:00",end_date:"05-08-2018 16:00",patient_id:1,user_id:user.id)
end


puts "created 1 appointment"
puts "created 2 user"
puts "created 10 patients"
