require 'rails_helper'

RSpec.describe Patient, type: :model do
  it {have_many(:patient_doctor)}
  it {have_many(:doctor).through(:patient_doctor)}
end
