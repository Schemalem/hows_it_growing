class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home questions matches about_us]

  def home
  end

  def questions
  end

  def matches
  end

  def plant_patch
  end

  def about_us
  end
end
