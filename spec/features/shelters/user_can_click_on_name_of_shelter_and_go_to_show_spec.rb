require 'rails_helper'

RSpec.describe "Shelter Show From Shelter Index Page", type: :feature do
  it "When i visit the shelter index page i can click a link to show shelter" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    visit "/shelters"

    has_link?("Puppies")
    click_link("Puppies")
    expect(current_path).to eq("/shelters/#{shelter1.id}")

  end
end
