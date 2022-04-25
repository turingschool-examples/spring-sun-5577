Rails.application.routes.draw do
  resources :hospitals, only: [:show] do
    resources :doctors, only: [:show]
  end

  delete "/doctor_patients", to: "doctor_patients#destroy"

  resources :patients, only: [:index]
end
