require 'rails_helper'

RSpec.describe 'Doctors Show Page' do
  describe 'Doctors Information' do
    it 'displays name, specialty and university of doctor' do
      hospital = Hospital.create!(name: 'Kaiser')
      doctor = hospital.doctors.create!(name: 'Amy', specialty: 'Cardiology', university: 'Harvard')
      paul = doctor.patients.create!(name: 'Paul', age: 25)
      glen = doctor.patients.create!(name: 'Glen', age: 35)

      hospital_2 = Hospital.create!(name: 'St. Judds')
      doctor_2 = hospital_2.doctors.create!(name: 'Karen', specialty: 'Cardiology', university: 'Stanford')
      joe = doctor_2.patients.create!(name: 'Joe', age: 25)
      bob = doctor_2.patients.create!(name: 'Bob', age: 35)

      visit "/doctors/#{doctor.id}"

      expect(page).to have_content('Amy')
      expect(page).to have_content('Kaiser')
      expect(page).to have_content('Cardiology')
      expect(page).to have_content('Harvard')
      expect(page).to have_content('Paul')
      expect(page).to have_content('Glen')

      expect(page).to_not have_content('Karen')
      expect(page).to_not have_content('St. Judds')
      expect(page).to_not have_content('Stanford')
      expect(page).to_not have_content('Bob')
      expect(page).to_not have_content('Joe')
    end

    it 'displays button to remove patient from doctor' do
      hospital = Hospital.create!(name: 'Kaiser')
      doctor = hospital.doctors.create!(name: 'Amy', specialty: 'Cardiology', university: 'Harvard')
      paul = doctor.patients.create!(name: 'Paul', age: 25)
      glen = doctor.patients.create!(name: 'Glen', age: 35)
      rob = doctor.patients.create!(name: 'Rob', age: 20)
      carlos = doctor.patients.create!(name: 'Carlos', age: 40)


      visit "/doctors/#{doctor.id}"

      expect(page).to have_content('Paul')
      expect(page).to have_content('Glen')
      expect(page).to have_content('Rob')
      expect(page).to have_content('Carlos')

      click_button 'Remove Paul'
      expect(page).to_not have_content('Paul')
      expect(page).to have_content('Glen')
      expect(page).to have_content('Rob')
      expect(page).to have_content('Carlos')

      click_button 'Remove Carlos'
      expect(page).to_not have_content('Paul')
      expect(page).to_not have_content('Carlos')
      expect(page).to have_content('Glen')
      expect(page).to have_content('Rob')

    end
  end
end
