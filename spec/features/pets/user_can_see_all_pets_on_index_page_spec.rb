require 'rails_helper'

RSpec.describe "shelter pets index page", type: :feature do
  it "can see all pets that can be adopted from that shelter with that shelter id" do
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

    visit "/pets"
    expect(page).to have_content(pet1.image)
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(Shelter.where("id = #{pet1.shelter_id}")[0].name)

    expect(page).to have_content(pet2.image)
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(Shelter.where("id = #{pet2.shelter_id}")[0].name)
  end
end
