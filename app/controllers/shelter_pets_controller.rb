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
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  # def edit
  #   @pet = Pet.find(params[:id])
  # end
  #
  # def update
  #   pet = Pet.find(params[:id])
  #   pet.update(pet_params)
  #   redirect_to "/pets/#{pet.id}"
  # end
  #
  # def destroy
  #   Pet.destroy(params[:id])
  #   redirect_to "/pets"
  # end

  private

  def get_shelter
    Shelter.find(params[:shelter_id])
  end

  def shelter_pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex)
  end
end
