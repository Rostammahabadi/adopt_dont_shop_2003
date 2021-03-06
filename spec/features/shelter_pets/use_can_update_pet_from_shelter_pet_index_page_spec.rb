require 'rails_helper'

RSpec.describe "Pet Update From Pets Index Page", type: :feature do
  it "user can update pet from pets index page" do
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
    has_link?("Update Pet")
    click_link("Update Pet", match: :first)

    expect(current_path).to eq("/pets/#{pet1.id}/edit")
    has_field?(:name)
    has_field?(:description)
    has_field?(:image)
    has_field?(:approximate_age)
    has_field?(:sex)
  end
end
