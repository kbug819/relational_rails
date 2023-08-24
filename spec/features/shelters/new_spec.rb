require 'rails_helper'

RSpec.describe "Disaster Shelter Index", type: :feature do
  describe "10.2 As a visitor" do
    describe "when I visit the parent index page" do
      describe "I see a link to create a new shelter record 'New Shelter" do
        describe "when I click the link, I'm taken to '/shelters/new' where I see a form for a new parent record" do
          describe "when I fill out the form with a new parent's attributes and I click the button" do
            describe "to create shelter, a past request is sent and a new parent record is created" do
              it "the new record is then shown on the resident page" do
                visit "/shelters/new"
                expect(page).to have_content("Enter a new shelter record:")
                expect(page).to have_content("Shelter Name")
                expect(page).to have_content("Address")
                expect(page).to have_content("Is Case Management Available")
                expect(page).to have_content("Capasity")
              end
            end
          end
        end
      end
    end
  end
end