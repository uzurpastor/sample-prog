require "test_helper"
require "integration/config.rb"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:shevchenko)
  end

  test "login with valid information" do 
    get login_path
    post login_path, params: { session: { email: "shevchenko@mail.com", password: "passwd" } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?

    assert_response :success
    assert_select "title", "User #{@user.name.capitalize} | Ruby"
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.email, 
                                          password: 'passwd' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!

    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    get logout_path 
    assert_not is_logged_in?
    assert_redirected_to home_path

    get logout_path 
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
  
  test "login with remembering" do    
    log_in_as(@user, remember_me: '1') 
    # debugger
    assert_not_nil cookies['remember_token']
    @request.cookies['remember_token'] = @user.remember_token   
  end
  
  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
