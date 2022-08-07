class RemoveColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email_activation, :integer
  end
end
