require "test_helper"

class TechnicalMailerTest < ActionMailer::TestCase
  def setup
    @user = users(name: 'Oleg',
                  email: 'valid.email@mail.net',
                  password: 'passwd',
                  password_confirmation: 'passwd')
  end
  test "account_activation" do
    mail = TechnicalMailer.account_activation(@user)
    assert_equal "Verefication your account", mail.subject
    assert_equal ["valid.email@mail.net"], mail.to
    assert_equal ["info@sample.app"], mail.from
  end

  test "password_reset" do
    mail = TechnicalMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
