require 'rails_helper'

Rspec.describe DoctorPatient do
  context 'relationships' do
    it { should belong_to :doctor }
    it { should belong_to :patient }
  end
end
