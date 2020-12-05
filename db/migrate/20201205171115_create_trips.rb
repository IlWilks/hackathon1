class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
