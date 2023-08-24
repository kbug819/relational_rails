class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def resident_view
    @shelter = Shelter.find(params[:id])
    @residents = @shelter.residents
  end

end