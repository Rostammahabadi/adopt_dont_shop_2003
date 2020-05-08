require 'rails_helper'

RSpec.describe "shelter pet creation", type: :feature do
  it "can fill out form and create pet" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    visit "/shelters/#{shelter1.id}/pets/new"


    page.has_field?("image")
    page.has_field?("name")
    page.has_field?("description")
    page.has_field?("approximate_age")
    page.has_field?("sex")

    fill_in :image, with: "URL"
    fill_in :name, with: "Jackson"
    fill_in :description, with: "Mastiff"
    fill_in :approximate_age, with: 3
    fill_in :sex, with: "female"

    click_on "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
    expect(page).to have_content("URL")
    expect(page).to have_content("Jackson")
    expect(page).to have_content(3)
    expect(page).to have_content("female")
  end
end
