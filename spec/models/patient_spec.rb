require 'rails_helper'

RSpec.describe Patient do
  context 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  context 'class methods' do
    it '#alphabetical returns all patients in alphabetical order by name' do
      anthonys = Hospital.create!(name: "St. Anthony's")

      anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
      bill = anthony.patients.create!(name: 'Billy Bob', age: 30)

      hank = anthonys.doctors.create!(name: 'Hank', specialty: 'Pediatric Care', university: 'The Doctoring University')
      dennis = hank.patients.create!(name: 'Dennis Dinkleburg', age: 40)

      tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')
      carl = tony.patients.create!(name: 'Carl Christianson', age: 43)

      d_health = Hospital.create!(name: "Denver Health")

      phil = d_health.doctors.create!(name: 'Dr. Phil', specialty: 'Humiliation', university: 'CBS')
      andrew = phil.patients.create!(name: 'Andrew Arnold', age: 25)

      expect(Patient.alphabetical).to eq([andrew, bill, carl, dennis])
      expect(Patient.alphabetical).to be_all(Patient)
    end
  end
end
