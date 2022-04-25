Rails.application.routes.draw do
  resources :doctors
  resources :hospitals
  resources :patients

  delete "/doctor_patients/:doctor_id", to: "doctor_patients#destroy"
end
