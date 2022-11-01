class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end

