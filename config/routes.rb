Rails.application.routes.draw do
  get '/doctor/:id', to: 'doctors#show'
  get '/hospital/:id', to: 'hospitals#show'
end
