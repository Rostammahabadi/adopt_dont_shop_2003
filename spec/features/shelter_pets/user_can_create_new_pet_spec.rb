require 'rails_helper'

RSpec.describe "Create pet from shelter pet page", type: :feature do
  it "use can create pet from shelter pet page" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    visit "/shelters/#{shelter1.id}/pets"

    has_link?("Create Pet")
    click_link("Create Pet")

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")

    fill_in :image, with: "image"
    fill_in :name, with: "Dobson"
    fill_in :description, with: "Boxer"
    fill_in :approximate_age, with: 2
    fill_in :sex, with: "Female"
    click_button("Create Pet")

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
    expect(page).to have_content("image")
    expect(page).to have_content("Dobson")
    expect(page).to have_content(2)
    expect(page).to have_content("Female")
  end
end
