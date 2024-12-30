class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :patent
      t.string :brand
      t.string :model_car
      t.string :string
      t.integer :seats
      t.string :transmision
      t.string :fuel
      t.boolean :is_available
      t.boolean :is_enable
      t.string :color
      t.integer :car_number
      t.string :year_model
      t.string :integer

      t.timestamps
    end
  end
end
