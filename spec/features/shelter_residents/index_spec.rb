require 'rails_helper'

RSpec.describe "Disaster Shelter resident_view", type: :feature do
  describe "5. As a visitor when I visit '/shelters/:id/residents" do
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

      visit "/shelters/#{austin_street.id}/residents"
      expect(page).to have_content(bradley.family_name)
      expect(page).to have_content("Long Term Housing Needed: #{bradley.long_term_housing_need}")
      expect(page).to have_content("Family Size: #{bradley.family_size}")
      expect(page).to have_content("Shelter ID: #{bradley.shelter_id}")
    end
  end

  describe "18 As a visitor" do
    describe "I can visit the residnt index page and see an edit button next to each resident" do
      it "will take the user to the edit page for that shelter" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
        visit "/shelters/#{arlington_life.id}/residents"        
        expect(page).to have_content("Edit Resident Record")
      end
    end
  end

  describe "23" do
    it "gives the user the ability to delete a resident from the index page" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
        visit "/shelters/#{arlington_life.id}/residents"
        expect(page).to have_button('delete')
    end
  end
end