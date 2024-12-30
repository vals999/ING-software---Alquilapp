class AddLicencia < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :hayLicencia, :boolean, default: false
  end
end
