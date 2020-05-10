require 'rails_helper'

RSpec.describe "Pet Delete From Pets Index Page", type: :feature do
  it "user can delete pet from pets index page" do
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

    visit "/pets/#{pet1.id}"
    has_link?("Delete Pet")
    click_link("Delete Pet", match: :first)

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet1)
    expect(page).to have_content(pet2.name)
  end
end
