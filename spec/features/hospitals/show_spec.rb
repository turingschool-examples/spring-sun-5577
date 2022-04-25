require 'rails_helper'

RSpec.describe 'the hospital show page', type: :feature do
  before do
    hospital_1 = Hospital.create!(name: "General Hospital")
    doctor_1 = hospital_1.doctors.create!(name: "Garth Marengi", specialty: "Emergency Medicine", university: "Darkplace University")
    doctor_2 = hospital_1.doctors.create!(name: "Brooke Waters", specialty: "Emergency Medicine", university: "Darkplace University")
    doctor_3 = hospital_1.doctors.create!(name: "Steve Stone", specialty: "Pediatric Medicine", university: "Medex Washington")
    doctor_4 = hospital_1.doctors.create!(name: "Lex Luthor", specialty: "Superman Medicine", university: "Medex Washington")
    doctor_5 = hospital_1.doctors.create!(name: "Harvey Dent", specialty: "Plastic Surgery", university: "Gotham University")
# require 'pry'; binding.pry
    visit "/hospitals/#{hospital_1.id}"
  end

  it 'I see the hospitals name and the number of doctors that work there and a unique list of universities that the doctors have attended' do
    within("#doctors") do
      expect(page).to have_content("Doctors that work here: 5")
      expect(page).to have_content("Darkplace University", count: 1)
      expect(page).to have_content("Medex Washington", count: 1)
      expect(page).to have_content("Gotham University", count: 1)
    end
  end

end
