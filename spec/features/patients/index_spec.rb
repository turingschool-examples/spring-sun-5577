require 'rails_helper'

describe "doctor show page" do
  before do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial")

    @doc1 = @hospital1.doctors.create!(name:"Meredith Grey", specialty: "General Surgery", university: "Dartmouth")
    @doc2 = @hospital1.doctors.create!(name:"Alex Karev", specialty: "Pediatrics", university: "School U")

    @d1_pat2 = Patient.create!(name: "Cruddy the Shelf", age: 34)
    @d1_pat1 = Patient.create!(name: "Buddy the Elf", age: 35)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat1.id)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat2.id)

    @d2_pat1 = Patient.create!(name: "A Child", age: 3)
    @d2_pat3 = Patient.create!(name: "Not So Much A Child", age: 100)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d2_pat1.id)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d1_pat2.id)

    visit "/patients"
  end

  it 'displays patients in order from oldest to youngest' do
    expect("Not So Much A Child").to appear_before("Buddy the Elf")
    expect("Buddy the Elf").to appear_before("Cruddy the Shelf")
    expect("Cruddy the Shelf").to appear_before("A Child")
  end
end
