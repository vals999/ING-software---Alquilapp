class AddConfirmationPasswordToSup < ActiveRecord::Migration[7.0]
  def change
    add_column :user_temp_sups, :password_confirmation, :string
  end
end
