class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home questions matches about_us]

  def home
  end

  def questions
  end

  def matches
    @plants = Plant.all
    @matches = @plants.sample(3)
    @user_plant = UserPlant.new
    #this replaces the user_plants new method as the info comes from this page
  end

  def plant_patch
    @user = current_user
    @my_plants = @user.user_plants
  end

  def about_us
  end
end
