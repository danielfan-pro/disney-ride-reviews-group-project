class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :image_url, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end

