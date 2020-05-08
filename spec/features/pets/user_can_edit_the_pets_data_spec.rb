require 'rails_helper'

RSpec.describe "user can update pet", type: :feature do
  it "can see form where they can edit the pet's data the reroute to the pet show page" do
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
    description: "Mastiff",
    approximate_age: 1,
    sex: "female"
    )

    pet2 = shelter1.pets.create(
    image: "image",
    name: "Joshua",
    description: "Boxer",
    approximate_age: 12,
    sex: "Male"
    )

    visit "/pets/#{pet1.id}/edit"

    fill_in :name, with: "Shashta"

    click_on("Update Pet")

    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content("Shashta")
  end
end
