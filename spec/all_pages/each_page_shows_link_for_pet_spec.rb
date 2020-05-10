require 'rails_helper'

RSpec.describe "pet name is dynamic on all pages", type: :feature do
  it "can link to pet on all pages" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    shelter2 = Shelter.create(
      name: "Paws",
      address: "989 west palms",
      city: "Denver",
      state: "CO",
      zip: 80202
      )

    pet1 = shelter1.pets.create(
    image: "post",
    name: "Adeline",
    approximate_age: 1,
    sex: "female"
    )

    pet2 = shelter2.pets.create(
    image: "image",
    name: "Joshua",
    approximate_age: 12,
    sex: "Male"
    )

    visit "/shelters/#{shelter1.id}/pets"
    has_link?("Adeline")
    click_link("Adeline")
    expect(current_path).to eq("/pets/#{pet1.id}")
    visit "/pets"
    has_link?("Adeline")
    click_link("Adeline")
    expect(current_path).to eq("/pets/#{pet1.id}")
  end
end
