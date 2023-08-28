require 'rails_helper'

RSpec.describe "Resident Show", type: :feature do
  describe "4. As a visitor when I visit '/residents/:id" do
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
      
      visit "/residents/#{bradley.id}" 
      expect(page).to have_content(bradley.family_name)
      expect(page).to have_content("Long Term Housing Need: #{bradley.long_term_housing_need}")
      expect(page).to have_content("Family Size: #{bradley.family_size}")
      expect(page).to have_content("Shelter ID: #{bradley.shelter_id}")
    end
  end

  describe "14 when a resident's show page is visited" do
    it "shows an edit button that allows the user to edit the resident entry" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")

      visit "/residents/#{jones.id}"
      expect(page).to have_content("Jones")
      expect(page).to have_content("Long Term Housing Need: true")
      expect(page).to have_content('Family Size: 4')
      click_link('Edit Resident Information')
      expect(page).to have_content("Family Name")
      expect(page).to have_content("Long Term Housing Needed?")
      expect(page).to have_content("Family Size")
      fill_in('family_name', with: "Test1")
      click_button('Update Resident Record')
      expect(page).to have_content("Test1")
      expect(page).to have_content("Long Term Housing Need: true")
      expect(page).to have_content('Family Size: 4')
    end
  end

  describe "User Story 20" do
    it "enables the user to permanently delete a record" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
      jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
      bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 
      visit "/residents/"
      expect(page).to have_content(jones.family_name)

      visit "/residents/#{jones.id}"
      expect(page).to have_button("delete")
      click_button("delete")
      expect(page).not_to have_content(jones.family_name)
    end
  end
end