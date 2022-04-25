Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: :show
  resources :hospitals, only: :show
  resources :patients, only: :index
  
  # Could theoretically have a similar route for patient doctors.
  delete "/doctors/:id/patients/:id/delete", to: "doctors_patients#destroy"
end
