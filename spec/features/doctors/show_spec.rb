require 'rails_helper'

describe "doctor show page" do
  before do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial")
    @hospital2 = Hospital.create!(name: "Grey Sloan Memorial")

    @doc1 = @hospital1.doctors.create!(name:"Meredith Grey", specialty: "General Surgery", university: "Dartmouth")
    @doc2 = @hospital1.doctors.create!(name:"Alex Karev", specialty: "Pediatrics", university: "School U")

    @d1_pat1 = Patient.create!(name: "Buddy the Elf", age: 35)
    @d1_pat2 = Patient.create!(name: "Cruddy the Shelf", age: 34)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat1.id)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat2.id)

    @d2_pat1 = Patient.create!(name: "A Child", age: 3)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d2_pat1.id)

    visit "/doctors/#{@doc1.id}"
  end

  it 'displays doctors name, specialty, and university' do
    expect(page).to have_content("Meredith Grey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("University: Dartmouth")
  end
end
