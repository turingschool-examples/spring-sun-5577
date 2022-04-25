require "rails_helper"

RSpec.describe "Doctor show page" do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @doc1 = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc2 = @hospital.doctors.create!(name: "Louise Tetric", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doc3 = @hospital.doctors.create!(name: "John Dietz", specialty: "Orthopedic Surgery", university: "Duke University")

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

  it "shows all of a doctors information" do
    visit doctor_path(@doc1)

    expect(page).to have_content(@doc1.name)
    expect(page).to have_content(@doc1.specialty)
    expect(page).to have_content(@doc1.university)
    expect(page).to_not have_content(@doc2.name)
  end

  it "has the hospital name for the doctor" do
    visit doctor_path(@doc1)

    expect(page).to have_content(@hospital.name)
  end

  it "has the name of all the doctors patients" do
    visit doctor_path(@doc1)

    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient3.name)
    expect(page).to have_content(@patient4.name)
    expect(page).to_not have_content(@patient5.name)
  end
end
