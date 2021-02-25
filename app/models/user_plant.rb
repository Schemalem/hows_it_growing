class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
end
