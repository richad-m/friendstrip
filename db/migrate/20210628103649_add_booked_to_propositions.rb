class AddBookedToPropositions < ActiveRecord::Migration[6.0]
  def change
    add_column :propositions, :booked, :boolean
  end
end
