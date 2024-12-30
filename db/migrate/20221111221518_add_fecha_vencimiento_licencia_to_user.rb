class AddFechaVencimientoLicenciaToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vencimiento_licencia,:date
    add_column :users, :licencia_aceptada,:boolean, default: false
  end
end
