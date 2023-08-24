require 'rails_helper'

RSpec.describe "Disaster Shelter Show", type: :feature do
  describe "2. As a visitor" do
    describe "when I visit '/shelter/:id" do
      it "then I see the parent with that id including the parent's attributes" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        visit "/shelters/#{arlington_life.id}"

        expect(page).to have_content(arlington_life.shelter_name)
        expect(page).to have_content("Address: #{arlington_life.address}")
        expect(page).to have_content("Case Management Available: #{arlington_life.case_management_available}")
        expect(page).to have_content("Capasity: #{arlington_life.capasity}")
      end
    end
  end

  describe "5. As a visitor" do
    describe "when I visit '/shelters/:id/residents" do
      it "then I see each resident that is associated with that Parent with each resident's attributes" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 
        
        visit "/shelters/#{arlington_life.id}/residents"

        expect(page).to have_content(jones.family_name)
        expect(page).to have_content("Long Term Housing Needed: #{jones.long_term_housing_need}")
        expect(page).to have_content("Family Size: #{jones.family_size}")
        expect(page).to have_content("Shelter ID: #{jones.shelter_id}")
      end
    end
  end

  describe "7. As a visitor" do
    describe "when I visit a shelter's show page" do
      it "I see a countt of the number of residents associated with this parent" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 

        visit "/shelters/#{arlington_life.id}"

        expect(page).to have_content("Current Resident Count: 1")
      end
    end
  end
end