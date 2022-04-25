require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { have_many :patient_doctor}
    it { have_many(:patient).through(:patient_doctor)}
  end
end
