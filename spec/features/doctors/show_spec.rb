require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do

  it "Shows an individual doctor's information" do
    hospital_1 = Hospital.new(name: "Pro Wrestling General Hospital")
    doctor_1 = Doctor.new(name: "Buff Bagwell", specialty: "The Stuff", university: "Hard Knocks", hospital_id: hospital_1.id)
    doctor_2 = Doctor.new(name: "Kidd Bandit", specialty: "Anime Surgery", university: "Game Changer University", hospital_id: hospital_1.id)
    patient_1 = Patient.new(name: "Kenny Omega", age: 36)
    patient_2 = Patient.new(name: "Edge", age: 43)
    patient_3 = Patient.new(name: "Sting", age: 65)

  end
end