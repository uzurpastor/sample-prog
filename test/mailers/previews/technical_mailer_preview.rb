# Preview all emails at http://localhost:3000/rails/mailers/technical_mailer
class TechnicalMailerPreview < ActionMailer::Preview
  def setup
    @user = users(name: 'Oleg',
                  email: 'valid.email@mail.net',
                  password: 'passwd',
                  password_confirmation: 'passwd')
  end
  # Preview this email at http://localhost:3000/rails/mailers/technical_mailer/account_activation
  def account_activation 
    user = User.first()
    TechnicalMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/technical_mailer/password_reset
  def password_reset 
    user = User.first()
    TechnicalMailer.password_reset(user)
  end

end
