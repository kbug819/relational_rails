class ShelterResidentsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    @residents = @shelter.residents
  end

  def new
    @shelter = Shelter.find(params[:id])
    @residents = @shelter.residents
  end

  def create
    @shelter = Shelter.find(params[:id])

    resident = Resident.new({
      family_name: params[:family_name],
      long_term_housing_need: params[:long_term_housing_need],
      family_size: params[:family_size],
      shelter_id: params[:shelter_id]
    })

    resident.save

    redirect_to action: "index"
  end
end