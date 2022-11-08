class AddImageToNewRide < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :ride_photo, :string
  end
end
