Rails.application.routes.draw do
  resources :doctors
  resources :hospitals

  delete "/doctor_patients/:doctor_id", to: "doctor_patients#destroy"
end
