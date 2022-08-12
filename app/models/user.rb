class User < ApplicationRecord
  attr_accessor :remember_token

  has_one :email_activation, dependent: :destroy
  has_one :admin, dependent: :destroy
  
  after_create :create_email_activation
  
  before_save { 
    name.capitalize!
    email.downcase! 
  }


  validates :name, presence:     true, 
                   length:     { maximum:  50 }
                   
  VALID_EMAIL_REGEX = /\A[\w.]+@[a-z\d]+(\.[a-z\d]+)*[a-z]+\z/i
  validates :email, presence:       true,
                    length:       { maximum:          250 },
                    format:       { with:             VALID_EMAIL_REGEX },
                    uniqueness:   { case_sensitive:   false }
  has_secure_password 
  validates :password, length:    { minimum:          6 },
                       allow_blank: true


  def create_email_activation
    
    digest = CrypterService.create_activation_digest
    email_activation = EmailActivation.create(  user_id: self.id,
                                                is_activated: false,
                                                activation_digest: digest ) 
    email_activation.errors.full_messages unless email_activation.valid?
  end

  def remember token
    update_attribute(:remember_digest, token );
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def admin?
    return false if self.admin.blank?
    self.admin.is_admin?
  end
end
