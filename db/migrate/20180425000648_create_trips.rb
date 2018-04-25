class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :country_id
      t.boolean :recommend?
      t.integer :year
      t.string :comment

      t.timestamps
    end
  end
end
