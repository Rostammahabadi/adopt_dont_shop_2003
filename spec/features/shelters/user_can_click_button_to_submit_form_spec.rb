require 'rails_helper'

RSpec.describe "new form page can submit", type: :feature do
  it "can submit form" do

    visit "/shelters/new"

    fill_in "name", with: "Puppies"
    fill_in "address", with: "123 west st"
    fill_in "city", with: "Arvada"
    fill_in "state", with: "Colorado"
    fill_in "zip", with: 80202

    expect(page).to have_button("Create Shelter")

    click_on(locator = 'Create Shelter')

    visit "/shelters"

    expect(page).to have_content("Puppies")
  end
end
