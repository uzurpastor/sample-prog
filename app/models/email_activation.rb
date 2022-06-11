class EmailActivation < ApplicationRecord
  belongs_to :user
  def new(user_id)
    digest = create_activation_digest
    EmailActivation.create( user_id: user_id,
                            is_activated: false,
                            activation_digest: digest)
  end

  def create_activation_digest
    token = User.new_token
    User.digest(token)
  end 
end
