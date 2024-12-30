class ChangeYearModel < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :year_model, :integer
  end
end
