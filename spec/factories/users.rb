FactoryBot.define do

  factory :user do
    email "test@test.com"
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Luis"
    last_name "Garcia"
    maternal_surname "Acosta"
    telephone"1234567890"
    street "Villa de nogal"
    number 12
    city "Zacatecas"
    mun "Guadalupe"
    country "México"
    tittle "Licenciado en Nutrición"
    suburb "Villas de Guadalupe"
    cp 98612
  end
end
