class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.datetime :datetime
      t.integer :temperature
      t.integer :dewpoint
      t.integer :windspeed

      t.timestamps
    end
  end
end
