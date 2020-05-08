class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pets = Pet.find(params[:id])
  end

  def new
    @shelter = get_shelter
  end

  def create
    shelter = get_shelter
    shelter.pets.create(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  private

  def get_shelter
    Shelter.find(params[:shelter_id])
  end

  def pet_params
    params.permit(:image,:name,:approximate_age,:sex,:description)
  end

end
