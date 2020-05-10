require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see the pet associated with that id" do
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
    sex: "female",
    adoptable_status: "adoptable"
    )

    pet2 = shelter1.pets.create(
    image: "image",
    name: "Joshua",
    description: "Boxer",
    approximate_age: 12,
    sex: "Male",
    adoptable_status: "adoptable"
    )

    visit "/pets/#{pet1.id}"
    expect(page).to have_content(pet1.image)
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.description)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.adoptable_status)


  end
end
