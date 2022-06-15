class TechnicalMailer < ApplicationMailer

  def account_activation(user)
    @greeting = "Hi"
    @user = user 
    # @email_activation = EmailActivation.find_by(user_id: @user.id).digest
    @link = edit_account_activation_url(EmailActivation.find_by(user_id: user.id))
    mail  to: @user.email,
          from: 'info@sample.app',
          subject: 'Verefication your account',
          template_path: 'mailers/technical_mailer',
          template_name: 'account_activation'

  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
