class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :icao
      t.string :name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
