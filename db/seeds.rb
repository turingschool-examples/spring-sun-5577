Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

@hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
@hospital1 = Hospital.create!(name: "Not my Hospital")
@doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
@doc1 = @hospital.doctors.create!(name: "Paul", specialty: "General Surgery", university: "Webster University")
@denny = @doc.patients.create!(name: "Denny Duquette", age: 39)
@john = @doc.patients.create!(name: "John", age: 49)
@ringo = @doc1.patients.create!(name: "Ringo", age: 70)
