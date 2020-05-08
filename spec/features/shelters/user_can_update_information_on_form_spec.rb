require 'rails_helper'

RSpec.describe "user can create a new shelter with form", type: :feature do
  it "can see create shelter form" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    visit "/shelters/#{shelter1.id}/edit"

    page.has_field?("name", with:'Puppies')
    page.has_field?("address", with:"123 west street")
    page.has_field?("city", with:"Scottsdale")
    page.has_field?("state", with:"AZ")
    page.has_field?("zip", with:85257)

    fill_in :name, with: "Puppies"
    fill_in :address, with: "123 west st"
    fill_in :city, with: "Arvada"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 80202

    click_button "Update Shelter"

    visit "/shelters/#{shelter1.id}/edit"

    page.has_text?("Puppies")
    page.has_text?("123 west st")
    page.has_text?("Arvada")
    page.has_text?("Colorado")
    page.has_text?(80202)

  end
end
