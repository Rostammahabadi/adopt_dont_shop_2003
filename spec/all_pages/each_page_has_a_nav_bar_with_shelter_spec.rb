require 'rails_helper'

RSpec.describe "nav bar", type: :feature do
  it "has a navigation bar ontop of each page with the pet index path" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
    )
    pet1 = shelter1.pets.create(
    image: "post",
    name: "Adeline",
    approximate_age: 1,
    sex: "female"
    )

    visit "/shelters"
    has_link?("Shelter")
    click_link("Shelter")
    expect(current_path).to eq("/shelters")
    visit "/shelters"
    has_link?("Shelter")
    click_link("Shelter")
    expect(current_path).to eq("/shelters")
    visit "/shelters/#{shelter1.id}"
    has_link?("Shelter")
    click_link("Shelter")
    expect(current_path).to eq("/shelters")

    visit "/shelters/#{shelter1.id}"
    has_link?("Shelter")
    click_link("Shelter")
    expect(current_path).to eq("/shelters")
  end

end
