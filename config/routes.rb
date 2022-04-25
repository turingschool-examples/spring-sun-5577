Rails.application.routes.draw do

  resources :hospitals, only: [:show]
  resources :doctors, only: [:show]
  resources :patients, only: [:index]
  
  delete '/doctors/:id', to: 'doctor_patients#destroy'
  
  # get '/patients', to: 'patients#index'
  # get '/doctors/:id', to: 'doctors#show'
  # get '/hospitals/:id', to: 'hospitals#show'
end
