
ActiveRecord::Schema.define(version: 2022_04_25_152716) do

  enable_extension "plpgsql"

  create_table "doctor_patients", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_patients_on_doctor_id"
    t.index ["patient_id"], name: "index_doctor_patients_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
    t.string "university"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "doctor_patients", "doctors"
  add_foreign_key "doctor_patients", "patients"
  add_foreign_key "doctors", "hospitals"
end
