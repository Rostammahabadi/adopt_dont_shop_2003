require 'rails_helper'

RSpec.describe "user can create a new shelter with form", type: :feature do
  it "can see create shelter form" do

    visit "/shelters"

    expect(page). to have_link("New Shelter")

    click_on("New Shelter")

    expect(current_path).to eq("/shelters/new")

    fill_in "name", with: "Puppies"
    fill_in "address", with: "123 west st"
    fill_in "city", with: "Arvada"
    fill_in "state", with: "Colorado"
    fill_in "zip", with: 80202

    expect(page).to have_button("Create Shelter")

    click_on(locator = 'Create Shelter')

    expect(current_path).to eq("/shelters")
    page.has_field?("name")
    page.has_field?("address")
    page.has_field?("city")
    page.has_field?("state")
    page.has_field?("zip")
  end
end
