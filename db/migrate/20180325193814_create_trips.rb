class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :start_address, null: false
      t.string :destination_address, null: false
      t.float :price, null: false
      t.float :distance, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
