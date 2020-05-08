class ShelterPetsController < ApplicationController
  def index
    @pets = Pet.where("shelter_id = #{params[:shelter_id]}")
  end

  def new

  end
end
