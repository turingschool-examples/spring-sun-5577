require 'rails_helper'

describe "doctor show page" do
  before do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial")

    @doc1 = @hospital1.doctors.create!(name:"Meredith Grey", specialty: "General Surgery", university: "Dartmouth")
    @doc2 = @hospital1.doctors.create!(name:"Alex Karev", specialty: "Pediatrics", university: "School U")

    @d1_pat1 = Patient.create!(name: "Buddy the Elf", age: 35)
    @d1_pat2 = Patient.create!(name: "Cruddy the Shelf", age: 34)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat1.id)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat2.id)

    @d2_pat1 = Patient.create!(name: "A Child", age: 3)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d2_pat1.id)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d1_pat2.id)

    visit "/doctors/#{@doc1.id}"
  end

  it 'displays doctors name, specialty, and university' do
    expect(page).to have_content("Meredith Grey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("University: Dartmouth")

    expect(page).not_to have_content("Alex Karev")
    expect(page).not_to have_content("Specialty: Pediatrics")
    expect(page).not_to have_content("University: School U")
  end

  it 'displays doctors hospital' do
    expect(page).to have_content("Grey Sloan Memorial")
  end

  it 'displays doctors patients' do
    within "#patient-#{@d1_pat1.id}" do
      expect(page).to have_content("Buddy the Elf, 35")
    end
    within "#patient-#{@d1_pat2.id}" do
      expect(page).to have_content("Cruddy the Shelf, 34")
    end

    expect(page).not_to have_content("A Child, 3")
  end

  it 'has a button to remove a patient from the doctors caseload' do
    within "#patient-#{@d1_pat2.id}" do
      expect(page).to have_content("Cruddy the Shelf, 34")
      click_button("Remove")
    end

    expect(current_path).to eq("/doctors/#{@doc1.id}")
    expect(page).not_to have_content("Cruddy the Shelf, 34")

    visit("/doctors/#{@doc2.id}")
    expect(page).to have_content("Cruddy the Shelf, 34")
  end
end
