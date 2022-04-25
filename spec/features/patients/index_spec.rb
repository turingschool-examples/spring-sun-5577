require "rails_helper"

RSpec.describe "Patient Index Page" do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Denver Health Hospital")

    @doc1 = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc2 = @hospital.doctors.create!(name: "Louise Tetric", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doc3 = @hospital.doctors.create!(name: "John Dietz", specialty: "Orthopedic Surgery", university: "Duke University")

    @patient1 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient2 = Patient.create!(name: "William Watt", age: 45)
    @patient3 = Patient.create!(name: "Tyler Wilson", age: 30)
    @patient4 = Patient.create!(name: "Margo Bardot", age: 20)
    @patient5 = Patient.create!(name: "Stan Shunpike", age: 46)

    @docpat1 = DoctorPatient.create!(doctor: @doc1, patient: @patient1)
    @docpat2 = DoctorPatient.create!(doctor: @doc1, patient: @patient2)
    @docpat3 = DoctorPatient.create!(doctor: @doc1, patient: @patient3)
    @docpat4 = DoctorPatient.create!(doctor: @doc1, patient: @patient4)
    @docpat5 = DoctorPatient.create!(doctor: @doc2, patient: @patient1)
    @docpat6 = DoctorPatient.create!(doctor: @doc2, patient: @patient5)
  end

  it "lists all patients from oldest to youngest" do
    visit patients_path

    # expect(@patient5.name).to appear_before(@patient2.name)
    # expect(@patient2.name).to appear_before(@patient1.name)
    # expect(@patient1.name).to appear_before(@patient4.name)
    # expect(@patient4.name).to appear_before(@patient3.name)
  end
end
