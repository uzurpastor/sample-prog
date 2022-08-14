require "test_helper"
require "integration/config"
class UsersControllerTest         < ActionDispatch::IntegrationTest

  def setup
    @user = users(:shevchenko)
    @other_user = users :admin
  end

  test "should get sign up" do 
    get sign_path
    assert_response :success
    assert_select "title", "Sign Up | Ruby"
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    process :patch, "/users/#{@user.id}", params: { user: {id: @user.id, name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path @user
    assert flash.empty?
    assert_redirected_to home_path
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    process :patch, "/users/#{@user.id}", params: { user: { name: @user.name, email: @user.email } }
    assert flash.empty?
    assert_redirected_to home_path
  end
end
