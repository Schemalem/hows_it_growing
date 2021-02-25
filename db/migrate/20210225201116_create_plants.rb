class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.string :space
      t.string :light
      t.string :type
      t.string :watering
      t.boolean :pet_friendly, default: false

      t.timestamps
    end
  end
end
