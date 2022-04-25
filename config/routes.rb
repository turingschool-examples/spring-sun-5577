Rails.application.routes.draw do

  get "/doctors/:doctor_id", to: "doctors#show"

end
