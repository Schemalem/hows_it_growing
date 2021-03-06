class Plant < ApplicationRecord
  has_many  :user_plants, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :space, presence: true, inclusion: { in: %w(Indoors Outdoors) }
  validates :light, presence: true
  validates :plant_type, presence: true, inclusion: { in: %w(Flowering Fern Vegetable Fruit Succulent) }
  validates :watering, presence: true
end
