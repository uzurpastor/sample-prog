class TechnicalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.technical_mailer.account_activation.subject
  #
  def account_activation(user)
    # debuger
    @greeting = "Hi"
    @user = user 
    mail  to: @user.email,
          from: 'info@sample.app',
          subject: 'Verefication your account',
          template_path: 'mailers/technical_mailer',
          template_name: 'account_activation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.technical_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
