class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shetler = Shelter.find(params[:shelter_id])
    shelter.pets.create(pet_params)
  end

  private

  def pet_params
    params.permit(:image,:name,:approximate_age,:sex,:description)
  end

end
