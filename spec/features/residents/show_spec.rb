require 'rails_helper'

RSpec.describe "Resident Show", type: :feature do
  describe "4. As a visitor" do
    describe "when I visit '/residents/:id" do
      it "then I see the resident with that id including the residen's attributes" do

        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
        visit "/residents/#{jones.id}" 

        expect(page).to have_content(jones.family_name)
        expect(page).to have_content("Long Term Housing Need: #{jones.long_term_housing_need}")
        expect(page).to have_content("Family Size: #{jones.family_size}")
        expect(page).to have_content("Shelter ID: #{jones.shelter_id}")
      end
      
    end
  end

  describe "14.1 when a resident's show page is visited" do
    it "shows an edit button that allows the user to edit the resident entry" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)

      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")

      visit "/residents/#{jones.id}"
      expect(page).to have_content("Edit Resident Information")
    end
  end

  describe "User Story 20" do
    it "enables the user to permanently delete a record" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 

        visit "/residents/#{jones.id}"
        expect(page).to have_button("delete")
    end
  end
end