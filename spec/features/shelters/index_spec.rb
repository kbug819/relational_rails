require 'rails_helper'

RSpec.describe "Disaster Shelter Index", type: :feature do
  describe "1. For each Shelter table" do
    describe "as a visitor" do
      describe "when I visit '/shelters'" do
        it "I see the name of each Shelter record in the system" do

          arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
          austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
          visit "/shelters"

          expect(page).to have_content(arlington_life.shelter_name)
          expect(page).to have_content(arlington_life.shelter_name)
        end
      end
    end
  end

  describe "6. As a Visitor" do
    describe "when I visit the parent index" do
      describe "I see that the records are ordered by most recently created first" do
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
  end
end