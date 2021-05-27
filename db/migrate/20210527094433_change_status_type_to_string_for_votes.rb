class ChangeStatusTypeToStringForVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :status, :string
  end
end
