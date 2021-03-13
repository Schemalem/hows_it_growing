class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @plants = Plant.search_form(params[:query])
    else
      @plants = Plant.all
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def plant_watering_message(plant)
    if plant.watering.include? "1-2 weeks"
      "Water every 1-2 weeks"
    elsif plant.watering.include? "2 weeks"
      "Water every 2 weeks"
    else "Water weekly"
    end
  end
  helper_method :plant_watering_message

  def plant_light_message(plant)
    if plant.light.include? "Medium to bright, indirect light"
      "Medium to bright, indirect light"
    elsif plant.light.include? "Low light to dappled sun"
      "Low light to dappled sun"
    elsif plant.light.include? "Medium indirect light to dappled sun"
      "Medium indirect light to dappled sun"
    elsif plant.light.include? "Low-light to dappled sun"
      "Low light to dappled sun"
    elsif plant.light.include? "Bright, indirect light to dappled sun"
      "Bright, indirect light to dappled sun"
    elsif plant.light.include? "Bright indirect light to dappled sun"
      "Bright indirect light to dappled sun"
    elsif plant.light.include? "Indirect light to dappled sun"
      "Indirect light to dappled sun"
    elsif plant.light.include? "Bright, indirect light. Keep out of direct sunlight"
      "Bright, indirect light. Keep out of direct sunlight."
    elsif plant.light.include? "Bright, indirect light"
      "Bright, indirect light"
    elsif plant.light.include? "Bright, Indirect light"
      "Bright, indirect light"
    else "Bright, indirect light"
    end
  end
  helper_method :plant_light_message

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :space, :light, :type, :watering, :pet_friendly, :photo)
  end
end
