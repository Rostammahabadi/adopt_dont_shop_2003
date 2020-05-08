class ShelterPetsController < ApplicationController
  def index
    binding.pry
    @param = params[:shelter_id]
    @pets = Pet.where("shelter_id = #{params[:shelter_id]}")
  end

  def new

  end
end
