class CreatePropositions < ActiveRecord::Migration[6.0]
  def change
    create_table :propositions do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.date :start_date
      t.date :end_date
      t.date :due_date
      t.string :title
      t.text :description
      t.string :url
      t.string :status

      t.timestamps
    end
  end
end
