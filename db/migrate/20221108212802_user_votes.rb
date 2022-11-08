class UserVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false

      t.integer :vote_value, default: 0
    end
  end
end