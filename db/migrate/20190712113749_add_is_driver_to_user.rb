class AddIsDriverToUser < ActiveRecord::Migration[5.1]
  def change
     add_column :users, :is_driver, :boolean, default: false
  end
end
