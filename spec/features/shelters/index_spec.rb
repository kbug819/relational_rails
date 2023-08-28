require 'rails_helper'

RSpec.describe "Disaster Shelter Index", type: :feature do
  describe "1. For each Shelter table" do
    it "I see the name of each Shelter record in the system" do

      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      visit "/shelters"

      expect(page).to have_content(arlington_life.shelter_name)
      expect(page).to have_content(austin_street.shelter_name)
    end
  end

  describe "6. As a Visitor" do
    describe "when I visit the parent index, records are ordered by recently created" do
      it "and next to each of the records I see when it was created" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        
        visit "/shelters"
        expect(page).to have_content(arlington_life.shelter_name)
        expect(page).to have_content(austin_street.shelter_name)
        expect(page).to have_content(arlington_life.created_at)
        expect(page).to have_content(austin_street.created_at)
      end
    end
  end

  describe "9. As a visitor when I visit any page on the site" do
    it "then I see a link at the top of the page that takes me to the shelter index" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
      austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
      bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")

      visit "/shelters"
      expect(page).to have_content("Shelter List")
      click_link("Shelter List")
      visit "/residents"
      expect(page).to have_content("Shelter List")
      click_link("Shelter List")
      visit "/residents/#{jones.id}/"
      expect(page).to have_content("Shelter List")
      click_link("Shelter List")
      visit "/shelters/#{arlington_life.id}/"
      expect(page).to have_content("Shelter List")
      visit "/shelters/#{arlington_life.id}/residents"
      expect(page).to have_content("Shelter List")
    end
  end

  describe "11 As a visitor" do
    describe "when I visit the parent index page I see a link to create a new shelter record 'New Shelter" do
      it "when I click the link, I'm taken to '/shelters/new' where I see a form for a new parent record" do
        visit "/shelters"
        expect(page).to have_content("Add New Shelter")
        click_link('Add New Shelter')
        expect(page).to have_content("Shelter Name")
        expect(page).to have_content("Address")
        expect(page).to have_content("Is Case Management Available")
        expect(page).to have_content("Capasity")
        fill_in('shelter_name', with: "Test1")
        fill_in('address', with: "addresstest")
        fill_in('case_management_available', with: "true")
        fill_in('capasity', with: "30")
        click_button('Submit New Shelter Record')
        expect(page).to have_content("Test1")
      end
    end
  end

  describe "17 As a visitor" do
    describe "I can visit the index page and see an edit button next to each shelter" do
      it "will take the user to the edit page for that shelter" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        visit "/shelters"
        expect(page).to have_content("Edit Shelter Record")
        click_link("Edit Shelter Record")
        expect(page).to have_content("Shelter Name")
        expect(page).to have_content("Address")
        expect(page).to have_content("Is Case Management Available")
        expect(page).to have_content("Capasity")
        fill_in('shelter_name', with: "Test1")
        fill_in('address', with: "addresstest")
        fill_in('case_management_available', with: "true")
        fill_in('capasity', with: "30")
        click_button('Update Shelter Record')
        expect(page).to have_content("Test1")
        expect(page).to have_content("Shelter Address: addresstest")
        expect(page).to have_content("Case Management Available: true")
        expect(page).to have_content("Capasity: 30")
      end
    end
  end

  describe "22" do
    it "gives the user the ability to delete a shelter from the index page" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        visit "/shelters"
        expect(page).to have_button('delete')
    end
  end


end