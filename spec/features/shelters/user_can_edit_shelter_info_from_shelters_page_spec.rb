require 'rails_helper'

RSpec.describe "Shelter Update From Shelter Index Page", type: :feature do
  it "When i visit the shelter index page i can click a link to edit" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    visit "/shelters"

    expect(page).to have_link("Edit Shelter")
    click_on("Edit Shelter")
    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")
  end
end
