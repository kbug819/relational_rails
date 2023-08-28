class ShelterResidentsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    # family_size = params[:family_size].to_i

    if params[:sorted] == "true"
      @residents = @shelter.residents.order_by_alphabetical

    elsif params[:family_size].present?
      @residents = @shelter.residents.only_specific_family_size(params[:family_size])
    else
      @residents = @shelter.residents
    end

    # if params[:sorted] == "true"
    #   @residents = @shelter.residents.order_by_alphabetical
    # end

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

  def sorted_a
    @shelter = Shelter.find(params[:id])
    @residents = @shelter.residents
    @sorted = @residents.order_by_alphabetical
  end

  def by_family_view
    @shelter = Shelter.find(params[:id])
    @residents = @shelter.residents
    family_size = params[:family_size].to_i
    @sorted = @residents.only_specific_family_size(family_size)

    # render 'by_family_view'
  end

  # def by_family_view
  #   @shelter = Shelter.find(params[:id])
  #   @residents = @shelter.residents
  #   family_size = params[:family_size].to_i
  #   @sorted = @residents.only_specific_family_size(family_size)
  # end



end