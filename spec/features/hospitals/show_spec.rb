require "rails_helper"

RSpec.describe "Hospital show page" do
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

  it "has hospital names" do
    visit hospital_path(@hospital)

    expect(page).to have_content(@hospital.name)
    expect(page).to_not have_content(@hospital2.name)
  end

  it "has the number of doctors affiliated with the hospital" do
    visit hospital_path(@hospital)

    within "#doc_count" do
      expect(page).to have_content(4)
    end
  end

  it "has a unique list of universities pertaining to doctors" do
    visit hospital_path(@hospital)

    expect(page).to have_content(@doc1.university)
    expect(page).to have_content(@doc2.university)
    expect(page).to have_content(@doc3.university, count: 1)
    expect(page).to_not have_content(@doc5.university)
  end
end
