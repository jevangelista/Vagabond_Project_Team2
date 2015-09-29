class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    id = params[:id]
    @city = City.find(id)
  end
end
