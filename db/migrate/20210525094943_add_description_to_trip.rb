class AddDescriptionToTrip < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :description, :text
  end
end
