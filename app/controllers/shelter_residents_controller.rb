class ShelterResidentsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    @residents = @shelter.residents
  end
end