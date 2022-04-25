require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it 'returns a unique list of university names' do
      hospital = Hospital.create!(name: 'UC Denver')
      hospital_2 = Hospital.create!(name: 'SLC')
      doctor_1 = hospital.doctors.create!(name: 'Chris', specialty: 'ER', university: 'UT')
      doctor_2 = hospital.doctors.create!(name: 'Sophie', specialty: 'PCP', university: 'Harvard')
      doctor_3 = hospital.doctors.create!(name: 'Sam', specialty: 'PCP', university: 'Harvard')
      doctor_4 = hospital.doctors.create!(name: 'Jason', specialty: 'PCP', university: 'Stanford')
      doctor_5 = hospital.doctors.create!(name: 'Juan', specialty: 'PCP', university: 'Stanford')
      doctor_6 = hospital_2.doctors.create!(name: 'Dave', specialty: 'PCP', university: 'Cornell')
      expect(hospital.university_list).to eq(["Harvard", "Stanford", "UT"])
    end
  end
end
