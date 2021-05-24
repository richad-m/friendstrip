class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :proposition, null: false, foreign_key: true
      t.text :comment
      t.boolean :status

      t.timestamps
    end
  end
end
