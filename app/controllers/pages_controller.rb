class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home questions matches about_us]

  def home
    @match = Match.new
  end

  def questions
    @match = Match.new
  end

  def matches
    #logic here!
    @plants = Plant.all
    # @matches = create_match
    @user_plant = UserPlant.new
    #this replaces the user_plants new method as the info comes from this page
  end

  def plant_patch
    @user = current_user
    @my_plants = @user.user_plants
  end

  def create_match
    # to_query = []
    to_query = q1_answer + ' ' + q2_answer# + q3_answer
    @matches = Plant.search_form(to_query)
    render 'pages/matches', locals: { testing: @matches }
  end

  def about_us
  end

  private

  def q1_answer
    answers_to_query = ''
    if params[:match][:q1] == "grow something edible"
      answers_to_query = ["Fruit", "Vegetable"].sample
    elsif params[:match][:q1] == "grow something beautiful"
      answers_to_query = "Flowering"
    elsif params[:match][:q1] == "grow something unkillable"
      answers_to_query = "Succulent"
    # else
    #   @answer = Plant.all
    end
    return answers_to_query
  end

  def q2_answer
    params[:match][:q2] == "don't mind" ? ['indoors', 'outdoors'].sample : params[:match][:q2]
  end
end
