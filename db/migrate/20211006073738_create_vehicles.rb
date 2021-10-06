class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string     :chassis_number, null: false
      t.string     :color
      t.string     :model, null: false
      t.decimal    :odometer_reading, precision: 8, scale: 1
      t.date       :registration_date
      t.integer    :year
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :vehicles, :model
  end
end
