require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it "displays list of unique univeristies of doctors at hospital" do
      hospital = Hospital.create!(name: 'Kaiser')
      doctor = hospital.doctors.create!(name: 'Amy', specialty: 'Cardiology', university: 'Harvard')
      doctor_2 = hospital.doctors.create!(name: 'Alex', specialty: 'Cardiology', university: 'Harvard')
      doctor_3 = hospital.doctors.create!(name: 'Jacob', specialty: 'Cardiology', university: 'Stanford')
      doctor_4 = hospital.doctors.create!(name: 'Hank', specialty: 'Cardiology', university: 'Stanford')
      doctor_5 = hospital.doctors.create!(name: 'Poe', specialty: 'Cardiology', university: 'Frankfurt')

      expect(hospital.unique_universities).to eq(['Harvard','Stanford','Frankfurt'])
    end
  end
end
