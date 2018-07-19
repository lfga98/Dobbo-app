10.times do |patient|
  Patient.create(first_name:"Leonardo",last_name: "Garcia", maternal_surname: "Acosta",age:10,date_birth: Date.today)
end

user = User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890")

puts "created 1 user"
puts "created 10 patients"
