class AddDestinationToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :destination, :string
  end
end
