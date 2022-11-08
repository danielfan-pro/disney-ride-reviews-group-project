class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :image_url
      t.string :description, null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end

