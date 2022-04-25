require "rails_helper"

RSpec.describe Hospital do
  describe "relationships" do
    it { should have_many(:doctors) }
  end

  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Denver Health Hospital")

    @doc1 = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc2 = @hospital.doctors.create!(name: "Louise Tetric", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doc3 = @hospital.doctors.create!(name: "John Dietz", specialty: "Orthopedic Surgery", university: "Duke University")
    @doc4 = @hospital.doctors.create!(name: "Sami Patel", specialty: "Cardiologist", university: "Duke University")
    @doc5 = @hospital2.doctors.create!(name: "Dana Scully", specialty: "Forensic Pathologist", university: "Georgetown University")

    @patient1 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient2 = Patient.create!(name: "William Watt", age: 35)
    @patient3 = Patient.create!(name: "Tyler Wilson", age: 30)
    @patient4 = Patient.create!(name: "Margo Bardot", age: 50)
    @patient5 = Patient.create!(name: "Stan Shunpike", age: 45)

    @docpat1 = DoctorPatient.create!(doctor: @doc1, patient: @patient1)
    @docpat2 = DoctorPatient.create!(doctor: @doc1, patient: @patient2)
    @docpat3 = DoctorPatient.create!(doctor: @doc1, patient: @patient3)
    @docpat4 = DoctorPatient.create!(doctor: @doc1, patient: @patient4)
    @docpat5 = DoctorPatient.create!(doctor: @doc2, patient: @patient1)
    @docpat5 = DoctorPatient.create!(doctor: @doc2, patient: @patient5)
  end

  describe "instance methods" do
    it "#doctor_count" do
      expect(@hospital.doctor_count).to eq(4)
    end

    it "#universities" do
      expect(@hospital.universities).to eq(["Duke University", "Johns Hopkins University", "Stanford University"].sort)
    end
  end
end
