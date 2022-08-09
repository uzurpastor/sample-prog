class ChangeFroreignKeyBeetwenUsersEa < ActiveRecord::Migration[7.0]
  def change
    remove_reference :email_activations, :user
    add_column :email_activations, :user_id, :integer
    add_foreign_key :email_activations, :users, 
      on_delete: :cascade
  end
end
