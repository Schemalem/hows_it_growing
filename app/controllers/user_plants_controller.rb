class UserPlantsController < ApplicationController
  def index
    @user_plants = UserPlant.all
  end

  # def new
  #   @user_plant = UserPlant.new
  #   @plant = Plant.find(params[:plant_id])
  # end

  def create
    @plant = Plant.find(params[:plant_id])
    @user_plant = UserPlant.new
    if current_user
      @user_plant.user = current_user
      @user_plant.plant = @plant
      # not sure how we'd link user_plant and plant. Woud it be @user_plant.plant?
      if @user_plant.save!
        redirect_to plant_patch_path
      else
        redirect_to matches_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user_plant = UserPlant.find(params[:id])
  end

  def edit
    @user_plant = UserPlant.find(params[:id])
  end

  def update
    @user_plant = UserPlant.find(params[:id])
    if @user_plant.update(user_plant_params)
      redirect_to @user_plant, notice: 'Your plant was successfully updated 🌱'
    else
      render :edit
    end
  end

  def destroy
    @user_plant = UserPlant.find(params[:id])
    @user_plant.destroy
    redirect_to @user_plant, notice: 'You killed your plant ☠️'
  end

  private

  def user_plant_params
    params.require(:user_plant).permit(:size) # watering schedule? Consider adding it so that the user can tell us that
    # they've watered their plant, and we don't seend to send a reminder
  end

  def user_plant_params_new
    params.require(:user_plant).permit(:start_date, :size, photos: [])
  end
end
