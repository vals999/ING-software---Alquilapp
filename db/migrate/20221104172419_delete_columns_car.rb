class DeleteColumnsCar < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :string, :string
    remove_column :cars, :integer, :string
  end
end
