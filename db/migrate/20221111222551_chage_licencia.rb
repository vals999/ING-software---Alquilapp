class ChageLicencia < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :licencia_aceptada,:licencia_rechazada
  end
end
