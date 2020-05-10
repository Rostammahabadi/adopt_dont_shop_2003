require 'rails_helper'

RSpec.describe "user can update shelter from show page", type: :feature do
  it "can see form to update shelter from show page" do
    shelter1 = Shelter.create(
      name: "Puppies",
      address: "123 west street",
      city: "Scottsdale",
      state: "AZ",
      zip: 85257
      )

    visit "/shelters/#{shelter1.id}"

    has_link?("Update Shelter")

    click_link("Update Shelter")

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    page.has_field?("name")
    page.has_field?("address")
    page.has_field?("city")
    page.has_field?("state")
    page.has_field?("zip")

    fill_in :name, with: "Abby's Shelter"
    fill_in :address, with: "995 22nd st"
    fill_in :city, with: "Denver"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 80203

    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    page.has_text?("Abby's Shelter")
    page.has_text?("995 22nd st")
    page.has_text?("Denver")
    page.has_text?("Colorado")
    page.has_text?(80203)

  end
end
