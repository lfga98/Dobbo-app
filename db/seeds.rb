10.times do |patient|
  Patient.create(first_name:"Leonardo",last_name: "Garcia", maternal_surname: "Acosta",age:10,date_birth: Date.today)
end

puts "created 10 patients"
