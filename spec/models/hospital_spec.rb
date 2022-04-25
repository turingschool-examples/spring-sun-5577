require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe "instance methods" do
    it "#unique_universities" do
    hospital_1 = Hospital.create!(name: "Rose Medical")
    hospital_2 = Hospital.create!(name: "Fake Hospital")
    doc_1 = hospital_1.doctors.create!(name: "Dr. Speth", specialty: "Optometry", university: "SCCO")
    doc_2 = hospital_1.doctors.create!(name: "Dr. Dog", specialty: "Music", university: "The Streets")
    doc_3 = hospital_1.doctors.create!(name: "Dr. LeGate", specialty: "Optometry", university: "SCCO")
    doc_4 = hospital_1.doctors.create!(name: "Dr. Smith", specialty: "Chiropractic", university: "SCUHS")
    doc_5 = hospital_2.doctors.create!(name: "Dr. Jan Itor", specialty: "Custodial Sciences", university: "Sacred Heart")

    expect(hospital_1.unique_universities).to eq(["SCCO", "SCUHS", "The Streets"])
    end
  end
end
