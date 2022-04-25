require 'rails_helper'

RSpec.describe 'doctor show page' do 
  it 'displays doctor info, their hospital and patients names' do 
	hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
	hospital2 = Hospital.create!(name: 'The Mayo Clinic')
	bailey = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
	christina = hospital2.doctors.create!(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", university: "Smith College")
	patient1 = Patient.create!(name: 'Katie Bryce', age: 25)
	patient2 = Patient.create!(name: 'Denny Duquette', age: 30)
	patient3 = Patient.create!(name: 'Cece Colvin', age: 18)
	DoctorPatient.create!(doctor: bailey, patient: patient1)
	DoctorPatient.create!(doctor: bailey, patient: patient2)
	DoctorPatient.create!(doctor: christina, patient: patient3)

	visit doctor_path(bailey.id)

	expect(page).to have_content(bailey.name)
	expect(page).to have_content(bailey.specialty)
	expect(page).to have_content(bailey.university)
	expect(page).to have_content(hospital1.name)
	expect(page).to have_content(patient1.name)
	expect(page).to have_content(patient2.name)		

	expect(page).to_not have_content(christina.name)
	expect(page).to_not have_content(christina.specialty)
	expect(page).to_not have_content(christina.university)
	expect(page).to_not have_content(hospital2.name)
	expect(page).to_not have_content(patient3.name)
  end
end