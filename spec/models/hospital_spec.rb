require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  it 'can count number of docs at hospital' do
    @hospital = Hospital.create!(name: "HospitalName")
    @hospital2 = Hospital.create!(name: "Hospital2Name")
    @doctor1 = @hospital.doctors.create!(name: "Doctor1Name", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital.doctors.create!(name: "Doctor2Name", specialty: "Malpractice", university: "Bogata Community College")
    @doctor3 = @hospital.doctors.create!(name: "Doctor3Name", specialty: "Podiatry", university: "Bogata Community College")
    @doctor4 = @hospital2.doctors.create!(name: "Doctor4Name", specialty: "Psychiatry", university: "Manson School for the Gifted")

    expect(@hospital.doc_count).to eq(3)
  end
end
