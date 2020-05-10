require 'rails_helper'

RSpec.describe "nav bar with pet index", type: :feature do
  it "user can see pet navigation to pets page" do

    visit "/pets"

    has_link?("Pets")
    visit "/shelters"

    has_link?("Pets")
  end
end
