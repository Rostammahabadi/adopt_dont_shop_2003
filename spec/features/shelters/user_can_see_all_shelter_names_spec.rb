require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelters titles" do
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

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
