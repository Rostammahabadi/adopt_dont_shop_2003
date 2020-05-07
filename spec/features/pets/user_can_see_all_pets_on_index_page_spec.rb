require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pets titles" do
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
    sex: "female",
    shelter_id: 14
    )

    visit "/pets"

    expect(page).to have_content(pet1.image)
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter)
  end
end
