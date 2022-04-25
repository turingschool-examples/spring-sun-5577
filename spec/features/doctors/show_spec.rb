require 'rails_helper'

RSpec.describe 'the doctor show page' do
   it 'shows all the attributes for a doctor' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
        visit "doctors/#{bailey.id}"
        expect(page).to have_content("Miranda Bailey")
        expect(page).to have_content("General Surgery")
        expect(page).to have_content("Stanford University")
        expect(page).to_not have_content("Patrick Dempsy")
        expect(page).to_not have_content("Brains")
        expect(page).to_not have_content("Oregon State University")
    end
   it 'shows all the patients for a doctor' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
      patient1 = bailey.patients.create!(name:"Drew", age:27)
      patient2 = bailey.patients.create!(name:"Daver", age:37)
      patient3 = mcdreamy.patients.create!(name:"Patty", age:69)
        visit "doctors/#{bailey.id}"
        expect(page).to have_content("Drew")
        expect(page).to have_content("Daver")
        expect(page).to_not have_content("Patty")
    end
   it 'shows name of hospitol for a doctor' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      hospital2 = Hospital.create!(name: "Turing Hospital")
      timmy = hospital2.doctors.create!(name: "Timmy", specialty: "Butts", university: "Turing University")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
      patient1 = bailey.patients.create!(name:"Drew", age:27)
      patient2 = bailey.patients.create!(name:"Daver", age:37)
      patient3 = mcdreamy.patients.create!(name:"Patty", age:69)
        visit "doctors/#{bailey.id}"
        save_and_open_page
        expect(page).to have_content("Grey Sloan Memorial Hospital")
        expect(page).to_not have_content("Turing Hospital")
    end
  end
