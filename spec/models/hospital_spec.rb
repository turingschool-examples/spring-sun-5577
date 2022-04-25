require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'sorting methods' do
    it 'Returns a list of unique universities attended by doctors for a hospital' do
      hospital_1 = Hospital.create(name: "Pro Wrestling General Hospital")
      hospital_2 = Hospital.create(name: "New Japan Pro General")
      doctor_1 = Doctor.create(name: "Buff Bagwell", specialty: "The Stuff", university: "Hard Knocks", hospital_id: hospital_1.id)
      doctor_2 = Doctor.create(name: "Kidd Bandit", specialty: "Anime Surgery", university: "Game Changer University", hospital_id: hospital_1.id)
      doctor_3 = Doctor.create(name: "Nick Gage", specialty: "Pizza-cutter Surgery", university: "Game Changer University", hospital_id: hospital_1.id)
      
      expect(hospital_1.unique_universities).to eq([doctor_1.university, doctor_2.university])
      expect(hospital_1.unique_universities).to_not eq([doctor_1.university, doctor_2.university, doctor_3.university])
      expect(hospital_2.unique_universities).to eq([])
    end
  end
end
