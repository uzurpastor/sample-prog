class CreateEmailActivations < ActiveRecord::Migration[7.0]
  def change
    create_table :email_activations do |t|
      t.references :user, null: false, foreign_key: {to_table: :users, column: :id}
      t.text :activation_digest
      t.boolean :is_activated
      t.datetime :activated_at
    end
  end
end
