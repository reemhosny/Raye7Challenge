class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :driver
      t.string :source
      t.string :destination
      t.datetime :departure_time
      t.integer :numberOfSeats
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
