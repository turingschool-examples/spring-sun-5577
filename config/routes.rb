Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]
  resources :doctor_patients, only: [:destroy]
  resources :patients, only: [:index, :show]
end
