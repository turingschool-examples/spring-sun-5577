Rails.application.routes.draw do

  get "/doctors/:doctor_id", to: "doctors#show"
  get "/hospitals/:hospital_id", to: "hospitals#show"

end
