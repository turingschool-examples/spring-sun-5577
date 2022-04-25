Rails.application.routes.draw do
    resources :doctors, only: [:show]
    resources :hospitals, only: [:show]
    resources :patients, only: [:index, :destroy]
end
