class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.boolean :is_admin
      t.integer :user_id
      t.foreign_key :users, 
        on_delete: :cascade
    end
  end
end
