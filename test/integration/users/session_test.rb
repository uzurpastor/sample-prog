require "test_helper"

class UsersSessionTest < ActionDispatch::IntegrationTest
  test "valid flash after invalid login" do
    get login_path
    assert flash.empty?

    post login_path, params: { session: { email: '', password: '' } }
    assert_equal "Invalid email or password", flash[:danger]
    get help_path
    assert flash.empty?
  end
end
