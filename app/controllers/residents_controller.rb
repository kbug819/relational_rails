class ResidentsController < ApplicationController
  def index
    @residents = Resident.all
  end

  # def show
  #   @disaster_shelter = DisasterShelter.find(params[:id])
  # end
end