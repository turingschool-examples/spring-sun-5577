require 'rails_helper'

RSpec.describe 'Patients Indx Page' do
  describe 'Patients Information' do
    it 'displays all patients in order from oldest to youngest' do
      hospital = Hospital.create!(name: 'Kaiser')
      doctor = hospital.doctors.create!(name: 'Amy', specialty: 'Cardiology', university: 'Harvard')
      doctor_2 = hospital.doctors.create!(name: 'Alex', specialty: 'Cardiology', university: 'Harvard')
      doctor_3 = hospital.doctors.create!(name: 'Jacob', specialty: 'Cardiology', university: 'Stanford')
      paul = doctor.patients.create!(name: 'Paul', age: 25)
      glen = doctor.patients.create!(name: 'Glen', age: 35)

      hospital_2 = Hospital.create!(name: 'St. Judds')
      doctor_4 = hospital_2.doctors.create!(name: 'Karen', specialty: 'Cardiology', university: 'Stanford')
      doctor_5 = hospital_2.doctors.create!(name: 'Karen', specialty: 'Cardiology', university: 'Stanford')
      joe = doctor_2.patients.create!(name: 'Joe', age: 20)
      bob = doctor_2.patients.create!(name: 'Bob', age: 40)

      visit "/patients"
      expect(bob.name).to appear_before(glen.name)
      expect(glen.name).to appear_before(paul.name)
      expect(paul.name).to appear_before(joe.name)
    end
  end
end
