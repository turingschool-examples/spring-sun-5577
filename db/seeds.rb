Hospital.destroy_all
Doctor.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

denny = bailey.patients.create!(name: "Denny Duquette", age: 39)
