require "test_helper"

class UsersControllerTest         < ActionDispatch::IntegrationTest

  def setup
    @user = users(:shevchenko)
  end

  test "should get sign up" do 
    get sign_path
    assert_response :success
    assert_select "title", "Sign Up | Ruby"
  end


  ###
  # => неадаптированный код с книги
  ###
  
  # test "should redirect edit when not logged in" do
  #   get :edit, id: @user.id 
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end

  # test "should redirect update when not logged in" do
  #   patch :update, id: @user , params: { user: { name: @user.name, email: @user.email } }
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end
  # test "should redirect edit when logged in as wrong user" do
  #   log_in_as(@other_user)
  #   get :edit, id: @user
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end

  # test "should redirect update when logged in as wrong user" do
  #   log_in_as(@other_user)
  #   patch :update, id: @user, user: { name: @user.name, email: @user.email }
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end
end
