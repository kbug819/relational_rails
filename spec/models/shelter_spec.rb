require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many :residents }
  end

  describe 'validations' do
    it { should validate_presence_of :shelter_name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :capasity}
    it { should allow_value(true).for(:case_management_available)}
    it {should allow_value(false).for(:case_management_available)}
  end

  describe "#6 the visitor will see on the shelter index page" do
    it "lists the shelters in order by date created" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      boston_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      Shelter.destroy(arlington_life.id)
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)

      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
      expect(Shelter.order_by_creation).to eq([austin_street, boston_street, arlington_life])
    end
  end

  describe "#7" do
    it "shows how many associated records on the shelter show page" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{arlington_life.id}")
      jackson = Resident.create!(family_name: "Bradley", long_term_housing_need: true, family_size: 2, shelter_id: "#{arlington_life.id}")
      monte = Resident.create!(family_name: "Bradley", long_term_housing_need: true, family_size: 2, shelter_id: "#{arlington_life.id}")

      expect(arlington_life.count_all).to eq(4)
    end
  end
end