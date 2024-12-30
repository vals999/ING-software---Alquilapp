class CreateUserTemps < ActiveRecord::Migration[7.0]
  def change
    create_table :user_temps do |t|
      t.string :name
      t.string :last_name
      t.integer :dni_nro
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
