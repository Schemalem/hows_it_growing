class CreateUserPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :user_plants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.date :start_date
      t.integer :size

      t.timestamps
    end
  end
end
