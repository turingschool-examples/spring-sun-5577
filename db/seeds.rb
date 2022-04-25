Hospital.destroy_all
Doctor.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
ploppy= hospital.doctors.create!(name: "Ploppy Gutcutter", specialty: "Gore", university: "Power Butcher University")
duke = hospital.doctors.create!(name: "Duke Gutcutter", specialty: "Gore", university: "Oregon State University")
patient1 = bailey.patients.create!(name:"Drew", age:27)
patient2 = bailey.patients.create!(name:"Daver", age:37)
patient3 = mcdreamy.patients.create!(name:"Patty", age:69)
