require 'rails_helper'

RSpec.describe "Disaster Shelter Index", type: :feature do
  describe "1. For each parent table" do
    describe "as a visitor" do
      describe "when I visit '/parents'" do
        it "I see the name of each parent record in the system" do

          arlington_life = DisasterShelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
          austin_street = DisasterShelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
          visit "/disaster_shelters"

          expect(page).to have_content(arlington_life.shelter_name)
          expect(page).to have_content(arlington_life.shelter_name)
        end
      end
    end
  end
end