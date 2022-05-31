require "test_helper"

class UsersControllerTest         < ActionDispatch::IntegrationTest

  test "should get sign up" do 
    get sign_path
    assert_response :success
    assert_select "title", "Sign Up | Ruby"
  end
end
