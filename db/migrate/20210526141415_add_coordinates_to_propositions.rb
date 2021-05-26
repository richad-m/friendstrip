class AddCoordinatesToPropositions < ActiveRecord::Migration[6.0]
  def change
    add_column :propositions, :latitude, :float
    add_column :propositions, :longitude, :float
    add_column :propositions, :address, :string
  end
end
