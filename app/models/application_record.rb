class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def ApplicationRecord.new_token
    SecureRandom.urlsafe_base64    
  end

  def ApplicationRecord.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
      BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def ApplicationRecord.create_activation_digest
    token = new_token
    digest(token)
  end 
end
