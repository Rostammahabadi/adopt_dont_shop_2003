class ShelterPetsController < ApplicationController
  def index
    @param = params[:shelter_id]
    @pets = Pet.where("shelter_id = #{params[:shelter_id]}")
  end

  def new
    @shelter = get_shelter
  end

  def create
    shelter = get_shelter
    shelter.pets.create(shelter_pet_params)

  private

  def get_shelter
    Shelter.find(params[:shelter_id])
  end

  def shelter_pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoptable_status)
  end
end
