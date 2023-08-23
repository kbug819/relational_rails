class DisasterSheltersController < ApplicationController
  def index
    @disaster_shelters = DisasterShelter.all
  end

  def show
    @disaster_shelter = DisasterShelter.find(params[:id])
  end
end