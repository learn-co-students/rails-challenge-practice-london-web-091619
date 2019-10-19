Rails.application.routes.draw do
  resources :buildings, only: [:show, :index, :edit, :update]
  resources :companies, only: [:show, :index, :new, :create]
  delete '/employees/:id', to: 'employees#destroy', as: 'destroy_employee'
  post '/employees/', to: 'employees#create', as: 'employees'
end
