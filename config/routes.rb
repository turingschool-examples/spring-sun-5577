Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]
  resources :patients, only: [:index]

  # resources :patient_doctors, only: [:destroy]
  delete "/doctors/:doctor_id/patient_doctors/:id", to: "patient_doctors#destroy"
  # delete "/doctors/:doctor_id/patients/:id", to: "patient_doctors#destroy"
  #I wasn't sure if this was the correct way to do this or how it could be done in resources or if it should have been what I have commented out above the handroll
end
