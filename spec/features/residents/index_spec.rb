require 'rails_helper'

RSpec.describe "Resident Index", type: :feature do
  describe "3. As a Visitor" do
    describe "when I visit /residents" do
      xit "I see the name of each resident record in the system" do

        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
        visit "/residents"

        expect(page).to have_content(jones.family_name)
        expect(page).to have_content(jones.long_term_housing_need)
        expect(page).to have_content(jones.family_size)
        expect(page).to have_content(jones.shelter_id)
        expect(page).to have_content(bradley.family_name)
        expect(page).to have_content(bradley.long_term_housing_need)
        expect(page).to have_content(bradley.family_size)
        expect(page).to have_content(bradley.shelter_id)
      end
    end
  end

  describe "8. As a visitor" do
    describe "when I visit any page on the site" do
      it "then I see a link at the top of the page that takes me to the resident index" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")

        visit "/shelters"
        expect(page).to have_content("List of All Residents")
        visit "/residents"
        expect(page).to have_content("List of All Residents")
        visit "/residents/#{jones.id}/"
        expect(page).to have_content("List of All Residents")
        visit "/shelters/#{arlington_life.id}/"
        expect(page).to have_content("List of All Residents")
        visit "/shelters/#{arlington_life.id}/residents"
        expect(page).to have_content("List of All Residents")
      end
    end
  end

  describe "#15 As a visitor, when a visitor visits the resident's index" do
    it "only shows records where the boolean column is true" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
      visit "/residents" 
      expect(page).not_to have_content(bradley)
    end
  end
end




