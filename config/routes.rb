Rails.application.routes.draw do
  resources :appointments
  resources :patients

  match "static/data", :to => "appointments#data", :as => "data", :via => "get"
  match "static/db_action", :to => "appointments#db_action", :as => "db_action", :via => "post"
  #get "static/data", to: "appointments#data", as: :data
  #get "static/db_action", to: "appointments#db_action", as: :db_action

    devise_for :users, controllers: { registrations: 'registrations' }
    root to: 'static#home'
end
