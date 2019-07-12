class CreatePickups < ActiveRecord::Migration[5.1]
  def change
    create_table :pickups do |t|
      t.string :source
      t.string :destination
      t.datetime :departure_time
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
