require 'rails_helper'

RSpec.describe "show all pets to a shelter", type: :feature do
  it "can show a link to all pets from the shelter show page" do
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
    visit "shelters/#{shelter1.id}"

    has_link?("All Pets")
    click_link("All Pets")
    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
  end
end
