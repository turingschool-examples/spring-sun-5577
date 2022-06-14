require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end
  it '#doc_count' do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc1 = @hospital.doctors.create!(name: "Paul", specialty: "General Surgery", university: "Webster University")

    expect(@hospital.doc_count).to eq(2)
  end

  it '#doc_unis' do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc1 = @hospital.doctors.create!(name: "Paul", specialty: "General Surgery", university: "Webster University")

    expect(@hospital.doc_unis).to eq(["Stanford University", "Webster University"])
  end

end
