class Plant < ApplicationRecord
  has_many  :user_plants, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :space, presence: true, inclusion: { in: %w(Indoors Outdoors) }
  validates :light, presence: true
  validates :plant_type, presence: true, inclusion: { in: %w(Flowering Fern Vegetable Fruit Succulent) }
  validates :watering, presence: true

  include PgSearch::Model
  pg_search_scope :search_form,
    against: [ :name, :type, :description, :light, :space, :plant_type, :watering],
    using: {
      tsearch: { prefix: true }
    }

  def plant_watering_message
    if watering.include? "1-2 weeks"
      "Water every 1-2 weeks"
    elsif watering.include? "2 weeks"
      "Water every 2 weeks"
    else "Water weekly"
    end
  end
  # helper_method :plant_watering_message

  def plant_light_message
    if light.include? "Medium to bright, indirect light"
      "Medium to bright, indirect light"
    elsif light.include? "Low light to dappled sun"
      "Low light to dappled sun"
    elsif light.include? "Medium indirect light to dappled sun"
      "Medium indirect light to dappled sun"
    elsif light.include? "Low-light to dappled sun"
      "Low light to dappled sun"
    elsif light.include? "Bright, indirect light to dappled sun"
      "Bright, indirect light to dappled sun"
    elsif light.include? "Bright indirect light to dappled sun"
      "Bright indirect light to dappled sun"
    elsif light.include? "Indirect light to dappled sun"
      "Indirect light to dappled sun"
    elsif light.include? "Bright, indirect light. Keep out of direct sunlight"
      "Bright, indirect light. Keep out of direct sunlight."
    elsif light.include? "Bright, indirect light"
      "Bright, indirect light"
    elsif light.include? "Bright, Indirect light"
      "Bright, indirect light"
    else "Bright, indirect light"
    end
  end
  # helper_method :plant_light_message
end
