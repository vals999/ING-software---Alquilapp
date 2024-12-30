class AddReclamoToUserSup < ActiveRecord::Migration[7.0]
  def change
    add_column :users,:reclamo,:boolean, default: false
  end
end
