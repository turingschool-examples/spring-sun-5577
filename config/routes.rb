Rails.application.routes.draw do
    resources :doctors, only: [:show]
    resources :hospitals, only: [:show]
    resources :patients, only: [:index]

    delete "/doctors/:doctor_id/patients/:id/delete", to: "doctor_patients#destroy"
end
