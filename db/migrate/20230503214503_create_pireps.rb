class CreatePireps < ActiveRecord::Migration[7.0]
  def change
    create_table :pireps do |t|
      t.references :pilot, null: false, foreign_key: true
      t.string :orig
      t.string :dest
      t.string :eqpt
      t.string :hours
      t.text :pirep

      t.timestamps
    end
  end
end
