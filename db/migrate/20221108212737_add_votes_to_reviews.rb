class AddVotesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :score, :integer, default: 0, null: false
  end
end