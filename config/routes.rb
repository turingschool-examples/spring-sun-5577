Rails.application.routes.draw do

  resources :hospitals, only: [:show]
  resources :doctors, only: [:show, :destroy]
  
  # get '/doctors/:id', to: 'doctors#show'
  # delete '/doctors/:id', to: 'doctors#destroy'

  # get '/hospitals/:id', to: 'hospitals#show'
end
