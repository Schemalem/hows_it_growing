class Plant < ApplicationRecord
  has_many  :user_plants 

  validates :name, presence: true
  validates :description, presence: true
  validates :space, presence: true, inclusion: { in: %w(Indoors Outdoors) }
  validates :light, presence: true
  validates :type, presence: true, inclusion: { in: %w(flowering fern vegetable fruit succulent)}
  validates :watering, presence: true
end
