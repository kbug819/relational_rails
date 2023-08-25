class ResidentsController < ApplicationController
  def index
    @residents = Resident.all
  end

  def show
    @resident = Resident.find(params[:id])
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    resident = Resident.find(params[:id])
    resident.update({
      family_name: params[:family_name],
      long_term_housing_need: params[:long_term_housing_need],
      family_size: params[:family_size]
    })
    resident.save
    redirect_to "/residents/#{resident.id}"
  end

end