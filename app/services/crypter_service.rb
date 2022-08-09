class CrypterService
  class << self
    def new_token
      SecureRandom.urlsafe_base64    
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    def create_activation_digest
      token = new_token
      digest(token)
    end 
    def digest_from_new_token
      digest new_token
    end
  end
end