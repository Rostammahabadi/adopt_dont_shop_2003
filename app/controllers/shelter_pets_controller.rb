class ShelterPetsController < ApplicationController
  def index
    @param = params[:shelter_id]
    @pets = Pet.where("shelter_id = #{params[:shelter_id]}")
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    shelter.pets.create(shelter_pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  private

  def shelter_pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex)
  end
end
