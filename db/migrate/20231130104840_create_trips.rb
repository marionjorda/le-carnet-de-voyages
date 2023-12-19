class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :description
      t.date :date_debut
      t.date :date_fin
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
