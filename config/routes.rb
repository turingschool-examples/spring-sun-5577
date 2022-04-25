Rails.application.routes.draw do
    resources :doctors, only: [:show]
    resources :patients, only: [:show, :destroy]
end
