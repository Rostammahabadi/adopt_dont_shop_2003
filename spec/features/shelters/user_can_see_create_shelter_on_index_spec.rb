require 'rails_helper'

RSpec.describe "user can create a new shelter with form", type: :feature do
  it "can see create shelter form" do

    visit "/shelters/new"

    page.has_field?("name")
    page.has_field?("address")
    page.has_field?("city")
    page.has_field?("state")
    page.has_field?("zip")
  end
end
