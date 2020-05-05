class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
    shelter.save
    redirect_to '/shelters'
  end

  # private
  # def shelter_params
  #   params.permit(:name)
  #   params.permit(:address)
  #   params.permit(:city)
  #   params.permit(:state)
  #   params.permit(:zip)
  # end
end