class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :space, :light, :type, :watering, :pet_friendly, :photo)
  end
end
