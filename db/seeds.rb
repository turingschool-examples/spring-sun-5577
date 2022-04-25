DoctorPatient.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

seattle_grace = Hospital.create!(name: "Seattle Grace Mercy West Hospital")
sacred_heart = Hospital.create!(name: "Sacred Heart")

grey = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id)
grey_2 = Doctor.create!(name: "Other Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id)
shepherd = Doctor.create!(name: "Derek Shepherd", specialty: "Neurosurgery", university: "Columbia", hospital_id: seattle_grace.id)
jd = Doctor.create!(name: "John Dorian", specialty: "Medical", university: "William and Mary", hospital_id: sacred_heart.id)

denny = Patient.create!(name: "Denny Duquette", age: 37)

grey_denny = DoctorPatient.create!(doctor_id: grey.id, patient_id: denny.id)
