class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false, unique: true
      t.string :name, null: false
      t.string :nationality

      t.timestamps
    end
    add_index :customers, :name
  end
end
