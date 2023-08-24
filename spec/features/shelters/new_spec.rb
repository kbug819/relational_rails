require 'rails_helper'

RSpec.describe "Disaster Shelter Index", type: :feature do
  describe "10.2 As a visitor" do
    describe "when I visit the parent index page" do
      describe "I see a link to create a new shelter record 'New Shelter" do
        it "when I click the link, I'm taken to '/shelters/new' where I see a form for a new parent record" do
          visit "/shelters"
          expect(page).to have_content("Add New Shelter")
        end
      end
    end
  end
end