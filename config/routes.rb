Rails.application.routes.draw do
  resources :hospitals, only: [:show] do
    resources :doctors, only: [:show]
  end
end
