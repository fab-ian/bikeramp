class ChangeDateField < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :date, :date
  end
end
