Rails.application.routes.draw do
  resources :patients
    devise_for :users, controllers: { registrations: 'registrations' }
    root to: 'static#home'
end
