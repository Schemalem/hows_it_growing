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
end
