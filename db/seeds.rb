DoctorPatient.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

seattle_grace = Hospital.create!(name: "Seattle Grace Mercy West Hospital")
grey = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id)
denny = Patient.create!(name: "Denny Duquette", age: 37)

grey_denny = DoctorPatient.create!(doctor_id: grey.id, patient_id: denny.id)
