class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :content
      t.foreign_key :users, 
        on_delete: :cascade
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
