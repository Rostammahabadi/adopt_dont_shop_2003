require 'rails_helper'

RSpec.describe "show page has delete button and can delete shelter", type: :feature do
  it "can see delete button and detele shelter" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )
    shelter2 = Shelter.create(
      name: "Pawsome",
      address: "123 east street",
      city: "Phoenix",
      state: "AZ",
      zip: 85020
      )

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_selector(:link_or_button, 'Delete Shelter')

    click_on('Delete Shelter')

    visit "/shelters"

    expect(page).to have_content(shelter2.name)
  end
end
