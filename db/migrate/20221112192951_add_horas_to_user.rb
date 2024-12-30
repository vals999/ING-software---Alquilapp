class AddHorasToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :saldoTemp, :integer
    rename_column :users, :saldoTemp, :horas
  end
end
