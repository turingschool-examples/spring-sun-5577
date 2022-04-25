require 'rails_helper'


RSpec.describe 'Doctors Show Page' do
  
  describe 'As a Visitor' do
    it 'has all of that doctors information/attributes: hospital, college, speciality' do
      hos1 = Hospital.create!(name: 'Big Hospital')
      hos2 = Hospital.create!(name: 'Other Hospital')
      
      doc1 = Doctor.create!(name: 'Barry Bonds', specialty: "Steroids", university: "San Fransciso State", hospital_id: hos1.id)
      doc2 = Doctor.create!(name: 'Sammy Sosa', specialty: "Corking Bats", university: "Wrigley College", hospital_id: hos2.id)

      pat1 = Patient.create!(name: 'Skeeter', age: 35)
      pat2 = Patient.create!(name: 'LugNut', age: 23)
      pat3 = Patient.create!(name: 'Ruby', age: 44)
      pat4 = Patient.create!(name: 'Wubbie', age: 67)

      #doc1 patients 
      docpat1 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat1.id)
      docpat2 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat2.id)
      docpat3 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat3.id)
      #doc2 patients
      docpat4 = DoctorPatient.create!(doctor_id: doc2.id, patient_id: pat4.id)
      
      visit "/doctors/#{doc1.id}"
    
      expect(page).to have_content("Name: Barry Bonds")
      expect(page).to have_content("Specialty: Steroids")
      expect(page).to have_content("University: San Fransciso State")
      expect(page).to have_content("Current Hospital: Big Hospital")
      #sad path
      expect(page).to_not have_content("Sammy Sosa")
      expect(page).to_not have_content("Corking Bats")
      expect(page).to_not have_content("Wrigley College")
      expect(page).to_not have_content("Wubbie")
    end 

    it 'has the name of all the patients this doctor has' do
      hos1 = Hospital.create!(name: 'Big Hospital')
      hos2 = Hospital.create!(name: 'Other Hospital')
      
      doc1 = Doctor.create!(name: 'Barry Bonds', specialty: "Steroids", university: "San Fransciso State", hospital_id: hos1.id)
      doc2 = Doctor.create!(name: 'Sammy Sosa', specialty: "Corking Bats", university: "Wrigley College", hospital_id: hos2.id)

      pat1 = Patient.create!(name: 'Skeeter', age: 35)
      pat2 = Patient.create!(name: 'LugNut', age: 23)
      pat3 = Patient.create!(name: 'Ruby', age: 44)
      pat4 = Patient.create!(name: 'Wubbie', age: 67)

      #doc1 patients 
      docpat1 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat1.id)
      docpat2 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat2.id)
      docpat3 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat3.id)
      #doc2 patients
      docpat4 = DoctorPatient.create!(doctor_id: doc2.id, patient_id: pat4.id)
      
      visit "/doctors/#{doc1.id}"

      expect(page).to have_content("Current Patients: ")

      within "#patient-#{pat1.id}" do
        expect(page).to have_content("Skeeter")
      end

      within "#patient-#{pat2.id}" do
        expect(page).to have_content("LugNut")
      end 

      within "#patient-#{pat3.id}" do
        expect(page).to have_content("Ruby")
      end 

      expect(page).to_not have_content("Wubbie")
    end 

    describe "Removing a Patient from a Doctor, Each Patient has a Remove Button" do
      
      it 'When I click a patients remove button, the page refreshes and they are no longer there' do
        hos1 = Hospital.create!(name: 'Big Hospital')
        
        doc1 = Doctor.create!(name: 'Barry Bonds', specialty: "Steroids", university: "San Fransciso State", hospital_id: hos1.id)

        pat1 = Patient.create!(name: 'Skeeter', age: 35)
        pat2 = Patient.create!(name: 'LugNut', age: 23)
        pat3 = Patient.create!(name: 'Ruby', age: 44)

        #doc1 patients 
        docpat1 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat1.id)
        docpat2 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat2.id)
        docpat3 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat3.id)
        visit "/doctors/#{doc1.id}"
        # save_and_open_page
        within "#patient-#{pat1.id}" do
          expect(page).to have_button("Remove This Patient")
        end 

        within "#patient-#{pat2.id}" do
          expect(page).to have_button("Remove This Patient")
        end 

        within "#patient-#{pat3.id}" do
          click_button "Remove This Patient"
        end 
        expect(current_path).to eq("/doctors/#{doc1.id}")
        # save_and_open_page
        within "#all_patients" do
          expect(page).to_not have_content("Ruby")
          
          expect(page).to have_content("Skeeter")
          expect(page).to have_content("LugNut")  
        end
      end 
    end 

  end 
end