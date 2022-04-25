Rails.application.routes.draw do

  get '/doctors/:id', to: 'doctors#show'
  delete '/doctors/:id', to: 'doctors#destroy'


  get '/hospitals/:id', to: 'hospitals#show'

end
