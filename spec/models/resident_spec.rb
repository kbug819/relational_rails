require 'rails_helper'

RSpec.describe Resident do
  
  describe 'relationships' do
    it {should belong_to :shelter}
  end

  describe "#15 As a visitor, when a visitor visits the resident's index" do
    it "only shows records where the boolean column is true" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
      
      expect(Resident.only_true).to eq([jones])
    end
  end
end