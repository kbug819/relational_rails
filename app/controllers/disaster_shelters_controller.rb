class DisasterSheltersController < ApplicationController
  def index
    @disaster_shelters = DisasterShelter.all
  end
end