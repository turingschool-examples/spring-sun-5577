Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hospitals/doctors/:id', to: 'hospitals_doctors#show'
  get '/hospitals/:id', to: 'hospitals#show'
end
