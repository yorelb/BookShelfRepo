class CreateFollows < ActiveRecord::Migration[8.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
    add_index :follows, :followed_id
    add_index :follows, :follower_id
    # Stop users from following the same person twice
    add_index :follows, [ :follower_id, :followed_id ], unique: true
  end
end
