class ChangeTypeInPlants < ActiveRecord::Migration[6.0]
  def change
    rename_column :plants, :type, :plant_type
  end
end
