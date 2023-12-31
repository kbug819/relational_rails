require 'rails_helper'

RSpec.describe "Resident Index", type: :feature do
  describe "3. As a Visitor when I visit /residents" do
    it "I see the name of each resident record in the system" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: true, family_size: 2, shelter_id: "#{austin_street.id}")
      
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

  describe "8. As a visitor when I visit any page on the site" do
    it "then I see a link at the top of the page that takes me to the resident index" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
      
      visit "/"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")

      visit "/shelters"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
      expect(page).to have_content("All Residents")
      visit "/shelters/#{arlington_life.id}/"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
      visit "/shelters/#{arlington_life.id}/edit"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
      visit "/shelters/new"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")

      visit "/residents"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
      visit "/residents/#{jones.id}/"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
      visit "/residents/#{jones.id}/edit"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")

      visit "/shelters/#{arlington_life.id}/residents"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
      visit "/shelters/#{arlington_life.id}/residents/new"
      expect(page).to have_content("List of All Residents")
      click_link("List of All Residents")
    end
  end

  describe "#15 As a visitor, when I visit the resident's index" do
    it "only shows records records where the boolean column is true" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
      
      visit "/residents" 
      expect(page).not_to have_content(bradley.family_name)
      expect(page).to have_content(jones.family_name)
    end
  end

  describe "18 As a visitor" do
    describe "I can visit the resident index page and see an edit button next to each resident" do
      it "will take the user to the edit page for that shelter" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        
        visit "/residents"
        expect(page).to have_content("Edit Resident Record")
        click_link("Edit Resident Record")
        expect(page).to have_content("Family Name")
        expect(page).to have_content("Family Size")
        fill_in('family_name', with: "Test1")
        fill_in('long_term_housing_need', with: "true")
        fill_in('family_size', with: "3")
        click_button('Update Resident Record')
        expect(page).to have_content("Test1")
        expect(page).to have_content("Long Term Housing Need: true")
        expect(page).to have_content("Family Size: 3")
      end
    end
  end

  describe "23" do
    it "gives the user the ability to delete a resident from the index page" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
        
        visit "/residents"
        expect(page).to have_button('delete')
        expect(page).to have_content(jones.family_name)
        click_button('delete')
        expect(page).not_to have_content(jones.family_name)
    end
  end
end




