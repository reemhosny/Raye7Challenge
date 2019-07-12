class AddIdToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :trip_id, :integer
    add_index  :places, :trip_id
    add_column :places, :pickup_id, :integer
    add_index  :places, :pickup_id
  end
end
