class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all.order_by_creation
  end

  def new
  end

  def show
    @shelter = Shelter.find(params[:id])
    @shelter_count = @shelter.count_all
  end

  def create
    shelter = Shelter.new({
      shelter_name: params[:shelter_name],
      address: params[:address],
      case_management_available: params[:case_management_available],
      capasity: params[:capasity]
    })
    shelter.save
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      shelter_name: params[:shelter_name],
      address: params[:address],
      case_management_available: params[:case_management_available],
      capasity: params[:capasity]
    })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end
end