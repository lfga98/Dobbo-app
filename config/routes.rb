Rails.application.routes.draw do
  resources :medical_histories
  resources :appointments
  resources :patients

  match "static/data", :to => "static#data", :as => "data", :via => "get"
  match "static/db_action", :to => "static#db_action", :as => "db_action", :via => "post"
  #get "static/data", to: "appointments#data", as: :data
  #get "static/db_action", to: "appointments#db_action", as: :db_action
  match 'diary' , :to => 'static#diary',:via => "get", :as => 'diary_show'
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'static#home'

end
