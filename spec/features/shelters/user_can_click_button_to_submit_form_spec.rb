require 'rails_helper'

RSpec.describe "new form page can submit", type: :feature do
  it "can submit form" do

    visit "/shelters/new"

    fill_in "shelter[name]", with: "Puppies"
    fill_in "shelter[address]", with: "123 west st"
    fill_in "shelter[city]", with: "Arvada"
    fill_in "shelter[state]", with: "Colorado"
    fill_in "shelter[zip]", with: 80202

    expect(page).to have_selector("input[type=submit][value='Create Shelter']")

    click_on('Create Shelter')

    visit "/shelters"

    expect(page).to have_content("Puppies")
  end
end
