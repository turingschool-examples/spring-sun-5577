require 'rails_helper'

RSpec.describe 'Doctors Show Page' do
  describe 'Doctors Information' do
    it 'displays name, specialty and university of doctor' do
      hospital = Hospital.create!(name: 'Kaiser')
      doctor = hospital.doctors.create!(name: 'Amy', specialty: 'Cardiology', university: 'Harvard')
      doctor_2 = hospital.doctors.create!(name: 'Alex', specialty: 'Cardiology', university: 'Harvard')
      doctor_3 = hospital.doctors.create!(name: 'Jacob', specialty: 'Cardiology', university: 'Stanford')
      paul = doctor.patients.create!(name: 'Paul', age: 25)
      glen = doctor.patients.create!(name: 'Glen', age: 35)

      hospital_2 = Hospital.create!(name: 'St. Judds')
      doctor_4 = hospital_2.doctors.create!(name: 'Karen', specialty: 'Cardiology', university: 'Stanford')
      doctor_5 = hospital_2.doctors.create!(name: 'Karen', specialty: 'Cardiology', university: 'Stanford')
      joe = doctor_2.patients.create!(name: 'Joe', age: 25)
      bob = doctor_2.patients.create!(name: 'Bob', age: 35)

      visit "/hospitals/#{hospital.id}"

      expect(page).to have_content("Kaiser")
      expect(page).to have_content(3)
      expect(page).to have_content("Harvard", count: 1)
      expect(page).to have_content("Stanford")

      expect(page).to_not have_content("St. Judds")
      expect(page).to_not have_content(2)
      expect(page).to_not have_content("Harvard", count: 2)
    end
  end
end
