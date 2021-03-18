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
    @matches = @plants.sample(3)
    @user_plant = UserPlant.new
    #this replaces the user_plants new method as the info comes from this page
  end

  def plant_patch
    @user = current_user
    @my_plants = @user.user_plants
  end

  def create_match
    # to_query = []
    to_query = q1_answer + ' ' + q2_answer + ' ' + q3_answer
    @matches = Plant.search_form(to_query).take(3)
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

  def q3_answer
    answers_to_query = ''
    if params[:match][:q3] == "1"
      answers_to_query = "no"
    elsif params[:match][:q3] == "2"
      answers_to_query = "low"
    elsif params[:match][:q3] == "3"
      answers_to_query = "indirect"
    elsif params[:match][:q3] == "4"
      answers_to_query = "medium"
    elsif params[:match][:q3] == "5"
      answers_to_query = "bright"
    end
    return answers_to_query
  end

end

