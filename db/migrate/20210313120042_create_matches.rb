class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.string :session

      t.timestamps
    end
  end
end
