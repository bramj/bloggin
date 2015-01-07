class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :status, null: false, default: 0
      t.datetime :release_at
      t.datetime :released_at
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :deleted_at
    add_index :posts, :status
  end
end
