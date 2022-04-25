require 'rails_helper'

RSpec.describe "doctor show page" do
  it "has name, specialty and univerity for that doctor, their hospital name, and all their patients" do
    hospital_1 = Hospital.create!(name: "Rose Medical")
    hospital_2 = Hospital.create!(name: "Fake Hospital")
    doc_1 = hospital_1.doctors.create!(name: "Dr. Speth", specialty: "Optometry", university: "SCCO")
    doc_2 = hospital_1.doctors.create!(name: "Dr. Dog", specialty: "Music", university: "The Streets")
    patient_1 = doc_1.patients.create!(name: "Retina Patient", age: 30)
    patient_2 = doc_1.patients.create!(name: "Glaucoma Patient", age: 40)
    patient_3 = doc_2.patients.create!(name: "Bass Player", age: 50)
    patient_4 = doc_2.patients.create!(name: "Guitar Player", age: 60)

    visit "/hospitals/#{hospital_1.id}/doctors/#{doc_1.id}"

    expect(page).to have_content("Name: Dr. Speth")
    expect(page).to have_content("Specialty: Optometry")
    expect(page).to have_content("University: SCCO")
    expect(page).to have_content("Hospital: Rose Medical")
    expect(page).to_not have_content("Hospital: Fake Hospital")
    expect(page).to_not have_content("Name: Dr. Dog")
    expect(page).to_not have_content("Specialty: Music")
    expect(page).to_not have_content("University: The Streets")

    within "#patients" do
      expect(page).to have_content("Retina Patient")
      expect(page).to have_content("Glaucoma Patient")
      expect(page).to_not have_content("Bass Player")
      expect(page).to_not have_content("Guitar Player")
    end
  end
  
  it "has a button to remove patients from the doctor's caseload" do
    hospital_1 = Hospital.create!(name: "Rose Medical")
    hospital_2 = Hospital.create!(name: "Fake Hospital")
    doc_1 = hospital_1.doctors.create!(name: "Dr. Speth", specialty: "Optometry", university: "SCCO")
    doc_2 = hospital_1.doctors.create!(name: "Dr. Dog", specialty: "Music", university: "The Streets")
    patient_1 = doc_1.patients.create!(name: "Retina Patient", age: 30)
    patient_2 = doc_1.patients.create!(name: "Glaucoma Patient", age: 40)
    patient_3 = doc_2.patients.create!(name: "Bass Player", age: 50)
    patient_4 = doc_2.patients.create!(name: "Guitar Player", age: 60)

    visit "/hospitals/#{hospital_1.id}/doctors/#{doc_1.id}"

    within "#patients" do
      expect(page).to have_content("Retina Patient")
      expect(page).to have_content("Glaucoma Patient")
    end
    
    click_button "Remove Retina Patient"

    expect(current_path).to eq("/hospitals/#{hospital_1.id}/doctors/#{doc_1.id}")
    
    #check that patient is removed from caseload
    within "#patients" do
      expect(page).to_not have_content("Retina Patient")
      expect(page).to have_content("Glaucoma Patient")
    end
    
    #check that patient record is not deleted entirely
    expect(Patient.find("#{patient_1.id}")).to eq(patient_1)
  end
end

# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

# NOTE: the patient record should not be deleted entirely