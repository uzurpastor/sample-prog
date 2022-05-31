require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "should show error with invalid sign up information" do 
    get sign_path
    assert_no_difference 'User.count' do
      post users_path,  params: { user: { name:                   "",
                                          email:                  "example@com",
                                          password:               "example1",
                                          password_confirmation:  "example2" } }
    end
    assert_template 'users/new'
    assert_template partial: 'shared/_error_messages'
  end


  test "should signup and show welcome text with valid sign up information" do 
    get sign_path
    assert_difference 'User.count' do
      post users_path,  params: { user: { name:                   "Username",
                                          email:                  "example@mail.com",
                                          password:               "example",
                                          password_confirmation:  "example" } }
      # follow_redirect!
    end
    assert_template 'users/show'
    assert_equal "welcome to my app!", flash[:success]
  end

end