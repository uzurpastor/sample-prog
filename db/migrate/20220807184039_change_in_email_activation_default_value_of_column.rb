class ChangeInEmailActivationDefaultValueOfColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_default :email_activations, :is_activated, false
  end
end
